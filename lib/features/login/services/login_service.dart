import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../../../core/utils/language/secure_storage.dart';
import '../models/login_response.dart';

class LoginUserService {
  final NetworkHandler _network = NetworkHandler();

  /// Finds the auth token wherever the backend placed it (meta.token,
  /// top-level token/access_token, or data.token/access_token) and persists it
  /// so subsequent authed requests send a real Bearer token.
  Future<void> _persistToken(
    Map<String, dynamic> json,
    LoginResponse response,
  ) async {
    final data = json['data'];
    final token = response.meta?.token ??
        json['token']?.toString() ??
        json['access_token']?.toString() ??
        (data is Map
            ? (data['token'] ?? data['access_token'])?.toString()
            : null);

    log('🔑 login token resolved: ${token == null ? 'NULL' : 'present'} | raw=$json');

    if (token != null && token.isNotEmpty) {
      await SecureStorageHelper.setAccessToken(token);
    }
  }

  Future<Result<LoginResponse, AppException>> loginUserService({
    required String username,
    required String password,
  }) async {
    final requestBody = {
      'email': username,
      'password': password,
    };

    try {
      return await _network.executeApiCall(() async {
        log("🔵 LOGIN REQUEST START");
        log("📤 Request Body: $requestBody");

        final response = await _network.postRequest(
          endpoint: ApiUrls.login,
          data: requestBody,
          // Send JSON with a matching Content-Type. The previous
          // form-urlencoded header shipped a JSON body, so Laravel couldn't
          // read email/password and always returned "Invalid login credentials".
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        );

        log("🟢 RAW RESPONSE: ${response.data}");

        final Map<String, dynamic> jsonResponse = response.data;

        /// ✅ DEBUG STATUS
        log("📌 API status: ${jsonResponse['status']}");
        log("📌 API message: ${jsonResponse['message']}");

        /// ✅ HANDLE API ERROR
        if (jsonResponse['status'] == 'error') {
          log("🔴 LOGIN FAILED — throwing AuthenticationFailedException");

          throw AuthenticationFailedException(
            response: {
              "error_description": jsonResponse["message"],
            },
          );
        }

        log("✅ LOGIN SUCCESS — mapping response");

        final loginResponse =
        LoginResponseMapper.fromMap(jsonResponse);

        await _persistToken(jsonResponse, loginResponse);

        return Success(loginResponse);
      });
    } on AuthenticationFailedException catch (e) {
      log("⛔ AuthenticationFailedException caught");
      log("⛔ Message: ${e.message}");
      return Error(e);
    } on AppException catch (e) {
      log("⛔ AppException caught: ${e.message}");
      return Error(e);
    } catch (e, stack) {
      log("🔥 UNKNOWN ERROR: $e");
      log("🔥 STACK: $stack");

      return Error(
        ServerErrorException(
          response: {"message": e.toString()},
        ),
      );
    }
  }



  // --- UPDATED GOOGLE LOGIN METHOD ---
  // Using Result<LoginResponse, AppException> to match your existing pattern
  Future<Result<LoginResponse, AppException>> loginWithGoogleService({
    required String idToken,
  }) async {
    final requestBody = {
      'id_token': idToken,
    };

    try {
      return await _network.executeApiCall(() async {
        // Use your _network handler instead of raw http.post
        final response = await _network.postRequest(
          endpoint: ApiUrls.googleLogin , // Or use an ApiUrls constant
          data: requestBody,
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
        );

        // Extract data (ensure your LoginResponseMapper works with this JSON structure)
        final Map<String, dynamic> jsonResponse = response.data;
        final loginResponse = LoginResponseMapper.fromMap(jsonResponse);

        await _persistToken(jsonResponse, loginResponse);

        return Success(loginResponse);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }

  // Add this to your LoginUserService class
  Future<Result<LoginResponse, AppException>> loginWithFacebookService({
    required String accessToken,
  }) async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.postRequest(
          endpoint: '/api/signup-with-facebook', // Need to create this endpoint in Laravel
          data: {'access_token': accessToken},
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
        );

        final Map<String, dynamic> jsonResponse = response.data;
        final loginResponse = LoginResponseMapper.fromMap(jsonResponse);

        await _persistToken(jsonResponse, loginResponse);

        return Success(loginResponse);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }
}

final loginUserServiceProvider = Provider.autoDispose<LoginUserService>(
      (ref) => LoginUserService(),
);