import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/category_response.dart';
import '../service/home_services.dart';


/// =======================
/// Categories Provider
/// =======================

class CategoryParams {
  final int page;

  CategoryParams({
    this.page = 1,
  });
}

class CategoryNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<CategoryItem>, CategoryParams> {
  @override
  FutureOr<List<CategoryItem>> build(CategoryParams args) async {
    final service = ref.watch(homeServiceProvider);

    final result = await service.getCategories(
      page: args.page,
    );

    return result.when(
          (successData) => successData,
          (error) => throw error,
    );
  }
}

final categoryProvider = AsyncNotifierProvider.autoDispose
    .family<CategoryNotifier, List<CategoryItem>, CategoryParams>(
  CategoryNotifier.new,
  name: 'categoryProvider',
);