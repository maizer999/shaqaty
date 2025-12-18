import 'package:flutter/material.dart';

import '../../../../../core/network/app_cached_image.dart';

class SectionGrid extends StatelessWidget {
  final List sections;

  const SectionGrid({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sections.map<Widget>((section) {
        final items = section["items"] ?? [];
        if (items.isEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section["title"] ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (_, index) {
                final item = items[index];
                return Column(
                  children: [
                    Expanded(
                      child:
                      AppCachedImage(
                        imageUrl: item["image"],
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    const SizedBox(height: 6),
                    Text(item["name"] ?? "",
                        overflow: TextOverflow.ellipsis),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
}
