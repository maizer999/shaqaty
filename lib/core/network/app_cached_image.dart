import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Make sure to add shimmer to pubspec.yaml

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // We define a cleaner, more modern loading color here
    final baseShimmerColor = Colors.grey[300]!;
    final highlightShimmerColor = Colors.grey[100]!;

    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 300), // Slightly slower for smoothness
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: baseShimmerColor,
        highlightColor: highlightShimmerColor,
        period: const Duration(milliseconds: 1500), // Smooth, slow sweep
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // We match the radius inside the placeholder too
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
        ),
      ),
      errorWidget: (_, __, ___) => Container(
        color: Colors.grey[200],
        child: const Icon(
          Icons.broken_image_outlined,
          color: Colors.grey,
        ),
      ),
    );

    if (borderRadius == null) return image;

    return ClipRRect(
      borderRadius: borderRadius!,
      child: image,
    );
  }
}