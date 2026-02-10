import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/sub_category_response.dart';

class SubCategoryService {
  final NetworkHandler _network = NetworkHandler();

  Future<Result<List<SubCategoryItem>, AppException>> getSubCategories({
    required int categoryId,
    int page = 1,
    String search = '',
    // 🔹 إضافة البارامترات الجديدة
    double? minPrice,
    double? maxPrice,
    double? minSize,
    double? maxSize,
    String? status,
  }) async {
    try {
      return await _network.executeApiCall(() async {
        // 🔹 بناء رابط الـ URL مع البارامترات بشكل ديناميكي
        final Map<String, dynamic> queryParams = {
          'category_id': categoryId,
          'page': page,
          if (search.isNotEmpty) 'search': search,
          if (minPrice != null) 'min_price': minPrice,
          if (maxPrice != null) 'max_price': maxPrice,
          if (minSize != null) 'min_size': minSize,
          if (maxSize != null) 'max_size': maxSize,
          if (status != null) 'status': status,
        };

        // تحويل الخريطة إلى سلسلة نصية للرابط (Query String)
        final queryString = Uri(queryParameters: queryParams.map((key, value) => MapEntry(key, value.toString()))).query;

        final response = await _network.getRequest(
          endpoint: '${ApiUrls.items}?$queryString',
          headers: await _network.getFormUrlencodedHeaders(),
        );

        // Map JSON to SubCategoryResponse
        final subCategoryResponse = SubCategoryResponseMapper.fromMap(response.data);

        // Extract the list of SubCategoryItem
        final categories = subCategoryResponse.data?.data ?? [];

        return Success(categories);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }
}

// Provider
final subCategoryServiceProvider =
Provider.autoDispose<SubCategoryService>((ref) => SubCategoryService());