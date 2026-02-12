import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/sub_category_response.dart';

// --- موديل المناطق ---
class AreaItem {
  final int id;
  final String name;
  AreaItem({required this.id, required this.name});

  factory AreaItem.fromMap(Map<String, dynamic> map) {
    return AreaItem(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }
}

// --- خدمة جلب المنتجات المحدثة ---
class SubCategoryService {
  final NetworkHandler _network = NetworkHandler();

  Future<Result<List<SubCategoryItem>, AppException>> getSubCategories({
    required int categoryId,
    int page = 1,
    String search = '',
    String? areaName, // 🔹 البارامتر الذي سنرسله للبحث النصي
    double? minPrice,
    double? maxPrice,
    double? minSize,
    double? maxSize,
    String? status,
  }) async {
    try {
      return await _network.executeApiCall(() async {
        // 1. تجميع كل البارامترات في خريطة (Map)
        final Map<String, dynamic> queryParams = {
          'category_id': categoryId.toString(),
          'page': page.toString(),
        };

        // 2. 🔹 إضافة اسم المنطقة للبحث (هذا هو الفلتر الجديد)
        if (areaName != null && areaName.isNotEmpty) {
          queryParams['area_name'] = areaName;
        }

        if (search.isNotEmpty) queryParams['search'] = search;
        if (minPrice != null) queryParams['min_price'] = minPrice.toString();
        if (maxPrice != null) queryParams['max_price'] = maxPrice.toString();
        if (minSize != null) queryParams['min_size'] = minSize.toString();
        if (maxSize != null) queryParams['max_size'] = maxSize.toString();
        if (status != null) queryParams['status'] = status;

        // 3. تحويل الخريطة إلى Query String بشكل آمن (يدعم العربية)
        final queryString = Uri(queryParameters: queryParams).query;

        // 4. دمج الـ QueryString مع الـ Endpoint الأصلي
        final response = await _network.getRequest(
          endpoint: '${ApiUrls.items}?$queryString',
          headers: await _network.getFormUrlencodedHeaders(),
        );

        final subCategoryResponse = SubCategoryResponseMapper.fromMap(response.data);
        return Success(subCategoryResponse.data?.data ?? []);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (e) {
      return Error(ServerErrorException());
    }
  }
}

// --- خدمة البحث عن المناطق ---
class AreaService {
  final NetworkHandler _network = NetworkHandler();

  Future<Result<List<AreaItem>, AppException>> getAreaSuggestions(String query) async {
    try {
      return await _network.executeApiCall(() async {
        // دمج المعايير يدوياً في الرابط ليتوافق مع الـ getRequest الخاص بك
        final response = await _network.getRequest(
          endpoint: "${ApiUrls.cites}?search=$query&lang=ar",
          headers: await _network.getFormUrlencodedHeaders(),
        );
        final List data = response.data['data'] ?? [];
        return Success(data.map((e) => AreaItem.fromMap(e)).toList());
      });
    } catch (e) {
      return Error(ServerErrorException());
    }
  }
}

// --- Providers المحدثة لتعمل مع اسم المنطقة المختارة ---
final subCategoryServiceProvider = Provider.autoDispose<SubCategoryService>((ref) => SubCategoryService());
final areaServiceProvider = Provider.autoDispose<AreaService>((ref) => AreaService());

final selectedAreaNameProvider = StateProvider.autoDispose<String?>((ref) => null);
// --- Providers ---
// final subCategoryServiceProvider = Provider.autoDispose<SubCategoryService>((ref) => SubCategoryService());
// final areaServiceProvider = Provider.autoDispose<AreaService>((ref) => AreaService());
final selectedAreaIdProvider = StateProvider<int?>((ref) => null);