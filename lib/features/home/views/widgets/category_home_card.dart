import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/theme/theme.dart';
import '../../../../../core/theme/ui_utils.dart';
import '../../../../../core/widgets/custom_text.dart';

class CategoryHomeCard extends StatelessWidget {
  final String title;
  final String url;
  final VoidCallback onTap;
  const CategoryHomeCard({
    super.key,
    required this.title,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: context.color.secondaryColor,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: UiUtils.imageType(url, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          CustomText(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            fontSize: context.font.smaller,
            color: context.color.textDefaultColor.withValues(alpha: .7),
          ),
        ],
      ),
    );
  }
}