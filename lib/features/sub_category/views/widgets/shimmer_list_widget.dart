// screens/widgets/shimmer_list_widget.dart
import 'package:flutter/material.dart';

class ShimmerListWidget extends StatelessWidget {
  const ShimmerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) => Container(
        margin: const EdgeInsets.all(12),
        height: 56,
        color: Colors.grey.shade300,
      ),
    );
  }
}
