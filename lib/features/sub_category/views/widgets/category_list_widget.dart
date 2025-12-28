import 'package:flutter/material.dart';

import '../../../../core/routes/route_constant.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../models/sub_category_response.dart';

class CategoryListWidget extends StatelessWidget {
  final List<SubCategoryItem> categories;
  final List<String> categoryIds;

  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.categoryIds,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, index) {
        final category = categories[index];
        return ListTile(
          tileColor: Theme.of(context).colorScheme.secondary,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(category.image ?? ''),
          ),
          title: CustomText(category.name ?? ''),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.adDetailsScreen,
              arguments: {
                'model': category,
              },
            );
          },
        );
      },
    );
  }
}
