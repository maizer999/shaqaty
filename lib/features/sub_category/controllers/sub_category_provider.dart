import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/sub_category_response.dart';
import '../services/sub_category_service.dart';

class SubCategoryParams {
  final int categoryId;
  final int page;
  final String search;

  // 🔹 الحقول الجديدة للفلترة
  final double? minPrice;
  final double? maxPrice;
  final double? minSize;
  final double? maxSize;
  final String? status;

  SubCategoryParams({
    required this.categoryId,
    this.page = 1,
    this.search = '',
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
      minPrice.hashCode ^
      maxPrice.hashCode ^
      minSize.hashCode ^
      maxSize.hashCode ^
      status.hashCode;
}

class SubCategoryNotifier extends AutoDisposeFamilyAsyncNotifier<List<SubCategoryItem>, SubCategoryParams> {
  @override
  FutureOr<List<SubCategoryItem>> build(SubCategoryParams arg) async {
    final service = ref.watch(subCategoryServiceProvider);

    // 🔹 تم تحديث الاستدعاء ليرسل بارامترات الفلترة للخدمة (Service)
    final result = await service.getSubCategories(
      categoryId: arg.categoryId,
      page: arg.page,
      search: arg.search,
      minPrice: arg.minPrice,
      maxPrice: arg.maxPrice,
      minSize: arg.minSize,
      maxSize: arg.maxSize,
      status: arg.status,
    );

    return result.when(
          (successData) => successData,
          (error) => throw error, // Passes AppException to the UI's error state
    );
  }
}

final subCategoryProvider = AsyncNotifierProvider.autoDispose
    .family<SubCategoryNotifier, List<SubCategoryItem>, SubCategoryParams>(
  SubCategoryNotifier.new,
  name: "subCategoryProvider",
);