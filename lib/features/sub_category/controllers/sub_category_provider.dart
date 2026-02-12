import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sub_category_response.dart';
import '../services/sub_category_service.dart';


// 2. تحديث الـ Params لتشمل الـ areaName
class SubCategoryParams {
  final int categoryId;
  final int page;
  final String search;
  final String? areaName; // 🔹 الحقل النصي للبحث (جاردنز، الجبيهة، إلخ)
  final double? minPrice;
  final double? maxPrice;
  final double? minSize;
  final double? maxSize;
  final String? status;

  SubCategoryParams({
    required this.categoryId,
    this.page = 1,
    this.search = '',
    this.areaName,
    this.minPrice,
    this.maxPrice,
    this.minSize,
    this.maxSize,
    this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SubCategoryParams &&
              runtimeType == other.runtimeType &&
              categoryId == other.categoryId &&
              page == other.page &&
              search == other.search &&
              areaName == other.areaName && // 🔹 أضف للمقارنة
              minPrice == other.minPrice &&
              maxPrice == other.maxPrice &&
              minSize == other.minSize &&
              maxSize == other.maxSize &&
              status == other.status;

  @override
  int get hashCode =>
      categoryId.hashCode ^
      page.hashCode ^
      search.hashCode ^
      areaName.hashCode ^ // 🔹 أضف للـ Hash
      minPrice.hashCode ^
      maxPrice.hashCode ^
      minSize.hashCode ^
      maxSize.hashCode ^
      status.hashCode;
}

// 3. تحديث الـ Notifier ليراقب اختيار المنطقة بالنص
class SubCategoryNotifier extends AutoDisposeFamilyAsyncNotifier<List<SubCategoryItem>, SubCategoryParams> {
  @override
  FutureOr<List<SubCategoryItem>> build(SubCategoryParams arg) async {
    final service = ref.watch(subCategoryServiceProvider);

    // 🔹 مراقبة الـ Provider الخاص باسم المنطقة المختارة
    // عندما يقوم المستخدم باختيار منطقة، سيتم استدعاء build مرة أخرى تلقائياً
    final currentSelectedArea = ref.watch(selectedAreaNameProvider);
    final activeArea = ref.watch(selectedAreaNameProvider);
    // نرسل الطلب للسيرفر مع إعطاء الأولوية للمنطقة المختارة حالياً في الـ UI
    final result = await service.getSubCategories(
      categoryId: arg.categoryId,
      page: arg.page,
      search: arg.search,
      areaName: activeArea ?? arg.areaName,
      minPrice: arg.minPrice,
      maxPrice: arg.maxPrice,
      minSize: arg.minSize,
      maxSize: arg.maxSize,
      status: arg.status,
    );

    return result.when(
          (successData) => successData,
          (error) => throw error,
    );
  }
}

final subCategoryProvider = AsyncNotifierProvider.autoDispose
    .family<SubCategoryNotifier, List<SubCategoryItem>, SubCategoryParams>(
  SubCategoryNotifier.new,
  name: "subCategoryProvider",
);