import 'package:flutter/material.dart';
import 'package:flutter_core/features/sub_category/views/widgets/category_items_tile.dart';
import 'package:flutter_core/features/sub_category/views/widgets/category_list_widget.dart';
import 'package:flutter_core/features/sub_category/views/widgets/shimmer_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/utils/no_data_found.dart';
import '../../../core/utils/no_internet.dart';
import '../../../core/widgets/something_went_wrong.dart';
import '../controllers/sub_category_provider.dart';

class SubCategoryScreen extends ConsumerWidget {
  final String catName;
  final int catId;
  final List<String> categoryIds;

  const SubCategoryScreen({
    super.key,
    required this.catName,
    required this.catId,
    required this.categoryIds,
  });

  static Route route(RouteSettings settings) {
    final args = settings.arguments as Map;
    return MaterialPageRoute(
      builder: (_) => SubCategoryScreen(
        catName: args['catName'],
        catId: args['catId'],
        categoryIds: args['categoryIds'],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategoriesAsync = ref.watch(
      subCategoryProvider(
        SubCategoryParams(categoryId: catId),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: CustomText(catName)),
      body: Column(
        children: [
          CategoryItemsTile(
            catName: catName,
            catId: catId,
            categoryIds: categoryIds,
          ),
          Expanded(
            child: subCategoriesAsync.when(
              data: (categories) {
                if (categories.isEmpty) {
                  return NoDataFound(
                    onTap: () => ref.refresh(
                      subCategoryProvider(
                        SubCategoryParams(categoryId: catId),
                      ),
                    ),
                  );
                }
                return CategoryListWidget(
                  categories: categories,
                  categoryIds: categoryIds,
                );
              },
              loading: () => const ShimmerListWidget(),
              error: (err, _) {
                if (err.toString().contains("no-internet")) {
                  return NoInternet(
                    onRetry: () => ref.refresh(
                      subCategoryProvider(
                        SubCategoryParams(categoryId: catId),
                      ),
                    ),
                  );
                }
                return const SomethingWentWrong();
              },
            ),
          ),
        ],
      ),
    );
  }
}
