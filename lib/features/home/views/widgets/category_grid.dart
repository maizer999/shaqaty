import 'package:flutter/material.dart';
import '../../../../../core/network/app_cached_image.dart';

class CategoryGrid extends StatelessWidget {
  final List categories;
  const CategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        final cat = categories[index];
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AppCachedImage(
                    imageUrl: cat["image"],
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            const SizedBox(height: 6),
            Text(
              cat["name"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}
