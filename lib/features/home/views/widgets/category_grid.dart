import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import '../../../../../core/network/app_cached_image.dart';
import '../../../sub_category/views/sub_category_screen.dart';
import '../../data/category_model.dart';
import '../../data/models/category_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import '../../../../../core/network/app_cached_image.dart';
import '../../data/models/category_response.dart';

class CategoryGridWidget extends StatelessWidget {
  final List<CategoryItem> categories;
  // Note: Ensure CategoryItem and CategoryModel are compatible or use the correct type
  final Function(CategoryItem) onCategorySelected;

  const CategoryGridWidget({
    super.key,
    required this.categories,
    required this.onCategorySelected
  });

  @override
  Widget build(BuildContext context) {
    print("DEBUG: CategoryGridWidget built with ${categories.length} items");

    if (categories.isEmpty) {
      print("DEBUG: Categories list is empty");
      return const SizedBox();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // Changed to allow scrolling if needed
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        final cat = categories[index];

        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // 1. Check if the click is registered
            print("DEBUG: Category Tapped: ID: ${cat.id}, Name: ${cat.name}");

            // 2. Call the callback passed from SelectCategoryScreen
            onCategorySelected(cat);
          },
          child: Container( // Added container to ensure the tap area is visible
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AppCachedImage(
                      imageUrl: cat.image ?? '',
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                CustomText(
                  cat.translatedName ?? cat.name ?? '',
                  textAlign: TextAlign.center,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}