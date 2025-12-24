import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/sub_category_response.dart';
import '../services/sub_category_service.dart';

class SubCategoryParams {
  final int categoryId;
  final int page;
  final String search;

  SubCategoryParams({
    required this.categoryId,
    this.page = 1,
    this.search = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SubCategoryParams &&
              runtimeType == other.runtimeType &&
              categoryId == other.categoryId &&
              page == other.page &&
              search == other.search;

  @override
  int get hashCode => categoryId.hashCode ^ page.hashCode ^ search.hashCode;
}


class SubCategoryNotifier extends AutoDisposeFamilyAsyncNotifier<List<SubCategoryItem>, SubCategoryParams> {
  @override
  FutureOr<List<SubCategoryItem>> build(SubCategoryParams arg) async {
    final service = ref.watch(subCategoryServiceProvider);

    final result = await service.getSubCategories(
      categoryId: arg.categoryId,
      page: arg.page,
      search: arg.search,
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