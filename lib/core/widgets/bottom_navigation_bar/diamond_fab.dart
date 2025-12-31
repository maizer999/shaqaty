import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum FabType { diamond, round, ellipse, svg }

class DiamondFab extends StatelessWidget {
  const DiamondFab({
    this.type = FabType.diamond,
    this.borderRadius = 20,
    this.svgAsset,
    this.svgSize = 80,
    this.onPressed, // add this
    super.key,
  }) : assert(
  type != FabType.svg || svgAsset != null,
  'svgAsset must not be null when type is FabType.svg',
  );

  final FabType type;
  final double borderRadius;
  final String? svgAsset;
  final double? svgSize;
  final VoidCallback? onPressed; // callback

  ShapeBorder? get _shapeBorder {
    return switch (type) {
      FabType.diamond => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      FabType.round => const CircleBorder(),
      FabType.ellipse => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      FabType.svg => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (type == FabType.svg) {
      if (svgAsset == null) throw Exception('svgAsset required for SVG');
      return GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(svgAsset!, height: svgSize, width: svgSize),
      );
    } else {
      return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: const Color(0xFF21899C),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: _shapeBorder,
        child: const Icon(Icons.add, size: 28),
      );
    }
  }
}

