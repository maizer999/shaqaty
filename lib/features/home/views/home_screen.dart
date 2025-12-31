import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_core/features/home/views/widgets/category_grid.dart';
import 'package:flutter_core/features/home/views/widgets/home_slider_widget.dart';
import 'package:get/get.dart';
import '../../../core/utils/shimmer_loading.dart';
import '../../../core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../common/base_scaffold.dart';
import '../providers/home_category_provider.dart';
import '../providers/home_slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final BottomNavigationController _bottomNavigationController =
  BottomNavigationController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderAsync = ref.watch(homeSliderProvider);

    final categoryAsync =
    ref.watch(categoryProvider(const CategoryParams(page: 1)));

    return BaseScaffold(
      showFab: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// =======================
              /// Home Slider
              /// =======================
              sliderAsync.when(
                data: (sliders) =>
                    HomeSliderWidget(sliders: sliders),
                loading: () =>ShimmerLoading(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                error: (_, __) => const SizedBox(),
              ),

              const SizedBox(height: 20),

              /// =======================
              /// Categories
              /// =======================
              categoryAsync.when(
                data: (categories) =>
                    CategoryGridWidget(categories: categories),
                loading: () =>
                    ShimmerLoading(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                error: (_, __) => const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
