import 'package:flutter/material.dart';
import '../../../../../core/network/app_cached_image.dart';
import '../../data/models/slider_response.dart';

class HomeSliderWidget extends StatelessWidget {
  final List<HomeSliderItem> sliders;

  const HomeSliderWidget({
    super.key,
    required this.sliders,
  });

  @override
  Widget build(BuildContext context) {
    if (sliders.isEmpty) return const SizedBox();

    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: sliders.length,
        itemBuilder: (_, index) {
          final slider = sliders[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppCachedImage(
              imageUrl: slider.image ?? '',
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}
