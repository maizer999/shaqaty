import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../../../main.dart';
import '../constants/app_strings.dart';
import '../exceptions/exceptions.dart';
import '../routes/auto_route_observer.dart';
import '../utils/file_utils.dart';
import '../utils/language/secure_storage.dart';
import '../utils/system_preferences_helper.dart';

class NetworkHandler {


  static final _okRange = List.generate(200, (i) => i + 200);
  static final _clientErrorsRange = List.generate(100, (i) => i + 400);
  static final _serverErrorsRange = List.generate(100, (i) => i + 500);
  late final Dio _dio;

  static Map<String, dynamic> currentRequest = {};

  /// Returns a configured Dio instance




  NetworkHandler({bool isPCs = false}) {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 90),
    ));

    if (kDebugMode) {
      _dio.interceptors.add(DioInterceptToCurl(printOnSuccess: true));
    }

    // Add cache interceptor
    _getCacheOptions().then((cacheOptions) {
      _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    });
  }

  // static Future<Interceptor> _getRefreshInterceptor(Dio dio, {bool isPCs = false}) async {
  //   return isPCs
  //       ? RefreshTokenPCSInterceptor(dio: dio, maxRetries: 3)
  //       : RefreshTokenInterceptor(dio: dio, maxRetries: 3);
  // }

  static Future<CacheOptions> _getCacheOptions() async {
    final cacheDir = await getApplicationCacheDirectory();
    final cacheStore = HiveCacheStore(cacheDir.path, hiveBoxName: "requestsBox");
    return CacheOptions(
      store: cacheStore,
      policy: CachePolicy.request,
      priority: CachePriority.high,
      maxStale: const Duration(days: 1),
      hitCacheOnErrorCodes: [401, 404],
      allowPostMethod: false,
    );
  }

  /// Compress string into Base64 (max 255 chars)
  static String compressString(String input) {
    final bytes = utf8.encode(input);
    final compressed = base64.encode(zlib.encode(bytes));
    if (compressed.length <= 255) return compressed;

    final hash = base64.encode(sha256.convert(bytes).bytes).substring(0, 6);
    return compressed.substring(0, 249) + hash;
  }

  static void _prepareRequest(
      String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      NetworkRequestType type, {
        String? fileName,
      }) {
    currentRequest
      ..["endpoint"] = endpoint
      ..["params"] = params
      ..["data"] = data
      ..["requestType"] = type
      ..["fileName"] = fileName;
  }

  // ============================ Basic Requests ============================
  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() => _dio.get(
      endpoint,
      queryParameters: params,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    ));
  }


  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() => _dio.post(
      endpoint,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    ));
  }

  Future<Response> putRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
  }) async {
    return _handleRequest(() => _dio.put(
      endpoint,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    ));
  }

  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
  }) async {
    return _handleRequest(() => _dio.delete(
      endpoint,
      data: data != null ? jsonEncode(data) : null,
      queryParameters: params,
      options: Options(headers: headers),
    ));
  }

  // ============================ Multipart Requests ============================
  Future<Response> postMultiPartRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
  }) async {
    final formData = await _prepareMultiPartData(data);
    return _handleRequest(() => _dio.post(
      endpoint,
      data: formData,
      queryParameters: params,
      options: Options(headers: headers),
    ));
  }


  Future<FormData> _prepareMultiPartData(Map<String, dynamic>? data) async {
    final formData = FormData();
    if (data == null) return formData;

    for (final entry in data.entries) {
      if (entry.value is File) {
        final file = entry.value as File;
        final mimeType = lookupMimeType(file.path);
        if (mimeType != null) {
          formData.files.add(MapEntry(
            entry.key,
            MultipartFile.fromFileSync(
              file.path,
              filename: file.path.split('/').last,
              contentType: DioMediaType.parse(mimeType),
            ),
          ));
        }
      } else {
        formData.fields.add(MapEntry(entry.key, entry.value.toString()));
      }
    }

    return formData;
  }

  // ============================ Internal Helpers ============================

  Future<Response> _handleRequest(Future<Response> Function() request) async {
    try {
      final response = await request();
      _logResponse(response);
      _validateStatus(response);
      return response;
    } on DioException catch (e) {
      _logError(e);
      throw _mapDioException(e);
    }
  }

  void _validateStatus(Response response) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300) return;

    throw _mapStatusToException(statusCode, response.data);
  }

  void _logResponse(Response response) {
    if (!kDebugMode) return;
    print('┌────────────── [http-response] ──────────────');
    print('│ URL: ${response.requestOptions.uri}');
    print('│ Status: ${response.statusCode}');
    print('│ Data: ${response.data}');
    print('└──────────────────────────────────────────────');
  }

  void _logError(DioException e) {
    if (!kDebugMode) return;
    print('┌────────────── [http-error] ────────────────');
    print('│ URL: ${e.requestOptions.uri}');
    print('│ Error: ${e.error}');
    print('│ Response: ${e.response?.data}');
    print('└──────────────────────────────────────────────');
  }

  AppException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return ConnectionIssueException(response: e.response?.data);
      case DioExceptionType.badResponse:
        return _mapStatusToException(e.response?.statusCode, e.response?.data);
      default:
        return ServerErrorException(response: e.response?.data);
    }
  }
  Future<Response> putMultiPartRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, String>? headers = const {},
  }) async {
    final formData = await _prepareMultiPartData(data);
    return _handleRequest(() => _dio.put(
      endpoint,
      data: formData,
      queryParameters: params,
      options: Options(headers: headers),
    ));
  }

  static Future<FormData> prepareMultiPartData(Map<String, dynamic>? data) async {
    final formData = FormData();
    if (data == null) return formData;

    for (final entry in data.entries) {
      if (entry.value is File) {
        final file = entry.value as File;
        final mimeType = lookupMimeType(file.path);
        if (mimeType != null) {
          formData.files.add(MapEntry(
            entry.key,
            MultipartFile.fromFileSync(
              file.path,
              filename: file.path.split('/').last,
              contentType: DioMediaType.parse(mimeType),
            ),
          ));
        }
      } else {
        formData.fields.add(MapEntry(entry.key, entry.value.toString()));
      }
    }

    return formData;
  }

  // ============================ Response Handlers ============================
  static Future _handleResult(Response response, {String? fileName}) async {
    final statusCode = response.statusCode ?? 0;

    if (_okRange.contains(statusCode)) {
      if (fileName != null) {
        final savePath = await getFileSavePath(fileName);
        final file = File(savePath);
        final sink = file.openWrite();
        await sink.addStream(response.data.stream);
        await sink.close();
        return savePath;
      }
      return response.data ?? {"success": true};
    }

    if (_clientErrorsRange.contains(statusCode) || _serverErrorsRange.contains(statusCode)) {
      throw _mapStatusToException(statusCode, response.data);
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      message: "Unexpected status",
    );
  }

  static Future _handleDioError(DioException e) {
    late final AppException exception;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        exception = ConnectionIssueException(response: e.response?.data);
        break;
      case DioExceptionType.badResponse:
        exception = _mapStatusToException(e.response?.statusCode, e.response?.data);
        break;
      default:
        exception = ServerErrorException(response: e.response?.data);
    }

    throw exception;
  }

  static AppException _mapStatusToException(int? statusCode, dynamic responseData) {
    switch (statusCode) {
      case 400:
      case 404:
      case 405:
        return InvalidRequestException(response: responseData);
      case 401:
      case 403:
        return AuthenticationFailedException(response: responseData);
      case 408:
        return ConnectionIssueException(response: responseData);
      case 500:
        return ServerErrorException(response: responseData);
      case 503:
        return ServiceUnavailableException(
            response: responseData is Map ? responseData : {"responseMessage": AppStrings.serverCurrentlyUnavailable});
      default:
        return ServerErrorException(response: responseData);
    }
  }

  // ============================ Headers ============================
   Future<Map<String, String>> getFormUrlencodedHeaders() async {
    final languageCode = await SystemPreferencesHelper.getLanguageCode();
    return {
      "Content-Type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonPostHeaders({bool isPCs = false}) async {
    final languageCode = await SystemPreferencesHelper.getLanguageCode();
    final token = isPCs
        ? await SecureStorageHelper.getPCSAccessToken()
        : await SecureStorageHelper.getAccessToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonHeaders({bool isPCs = false}) async {
    final languageCode = await SystemPreferencesHelper.getLanguageCode();
    final token = isPCs
        ? await SecureStorageHelper.getPCSAccessToken()
        : await SecureStorageHelper.getAccessToken();
    return {
      "Authorization": "Bearer $token",
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonMultipartHeaders() async {
    final token = getTempAccessToken() ?? await getAccessToken();
    return {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };
  }

  static String? getTempAccessToken() {
    final secureStorage = providerContainer.read(secureStorageProvider);
    return secureStorage.getTemp(key: 'access_token');
  }

  static Future<String?> getAccessToken() async => SecureStorageHelper.getAccessToken();

   Future<T> executeApiCall<T>(Future<T> Function() operation, {bool checkInternet = true}) async {
    try {
      return await operation();
    } on MapperException catch (e) {
      if (kDebugMode) print(e);
      throw MalformedOutputException();
    } on AppException {
      rethrow;
    } catch (_) {
      throw ServerErrorException();
    }
  }

}

enum NetworkRequestType {
  get,
  post,
  postMultipart,
  postDownload,
  getDownLoad,
  put,
  putMultipart,
  delete,
}

/// Wrapper for safe API calls

