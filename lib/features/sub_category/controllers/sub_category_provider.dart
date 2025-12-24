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
}

class SubCategoryNotifier extends AutoDisposeFamilyAsyncNotifier<List<SubCategoryItem>, SubCategoryParams> {
  @override
  FutureOr<List<SubCategoryItem>> build(SubCategoryParams args) async {
    final service = ref.watch(subCategoryServiceProvider);

    final result = await service.getSubCategories(
      categoryId: args.categoryId,
      page: args.page,
      search: args.search,
    );

    // Use `when` to handle Result
    return result.when(
          (successData) => successData, // successData is List<SubCategoryItem>
          (error) => throw error,       // throws AppException if error
    );
  }
}


final subCategoryProvider = AsyncNotifierProvider.autoDispose
    .family<SubCategoryNotifier, List<SubCategoryItem>, SubCategoryParams>(
  SubCategoryNotifier.new,
  name: "subCategoryProvider",
);
