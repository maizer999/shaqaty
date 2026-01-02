import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_core/features/addAds/views/add_item_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/shimmer_loading.dart';
import '../../common/base_scaffold.dart';
import '../../home/providers/home_slider_provider.dart';
import '../../home/views/widgets/category_grid.dart';
import '../../sub_category/views/sub_category_screen.dart';
import 'package:easy_localization/easy_localization.dart';


class SelectCategoryScreen extends ConsumerWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsync = ref.watch(categoryProvider(const CategoryParams(page: 1)));
    return BaseScaffold(
      title: "ddItemLbl".tr(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomText(
                "selectTheCategory".tr(),
               fontSize: 20
              ),
              const SizedBox(height: 16),

              // Grid with API data
              Expanded(
                child: categoryAsync.when(
                  data: (categories) => CategoryGridWidget(
                    categories: categories,
                    onCategorySelected: (selectedCat) {
                      print("DEBUG: Category Clicked: ${selectedCat.name}");

                      // Check if there are sub-categories available
                      // Using .isEmpty or checking if the list is null
                      bool hasSubCategories = selectedCat.subcategories != null &&
                          selectedCat.subcategories!.isNotEmpty;

                      if (hasSubCategories) {
                        print("DEBUG: Navigating to SubCategoryScreen (Sub-categories found)");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubCategoryScreen(
                              catName: selectedCat.translatedName ?? selectedCat.name ?? '',
                              catId: selectedCat.id ?? 0,
                         breadCrumbItems: [selectedCat],
                            ),
                          ),
                        );
                      } else {
                        print("DEBUG: Navigating to AddItemDetails (Final Category)");
                        // Since there are no sub-categories, we go to the form
                        Navigator.push(
                          context,
                          AddItemDetails.route(
                            RouteSettings(
                              arguments: {
                                "breadCrumbItems": [selectedCat], // Pass as a list for breadcrumbs
                                "isEdit": false,
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),

                  error: (err, _) => Center(child: Text("Error: $err")),
                    loading: () =>  ShimmerLoading(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
