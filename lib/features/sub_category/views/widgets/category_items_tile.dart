import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/routes/route_constant.dart';
import '../../../../core/widgets/custom_text.dart';

class CategoryItemsTile extends StatelessWidget {
  final String catName;
  final int catId;
  final List<String> categoryIds;

  const CategoryItemsTile({
    super.key,
    required this.catName,
    required this.catId,
    required this.categoryIds,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.itemsList,
          arguments: {
            'catID': catId.toString(),
            'catName': catName,
            'categoryIds': categoryIds,
          },
        );
      },
      child: ColoredBox(
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomText(
            "${"allIn".tr} $catName",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
