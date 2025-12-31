import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/shimmer_loading.dart';
import '../../common/base_scaffold.dart';
import '../../home/providers/home_slider_provider.dart';
import '../../home/views/widgets/category_grid.dart';

class SelectCategoryScreen extends ConsumerWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsync = ref.watch(categoryProvider(const CategoryParams(page: 1)));
    return BaseScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Grid with API data
              Expanded(
                child: categoryAsync.when(
                  data: (categories) => CategoryGridWidget(categories: categories),
                  loading: () => ShimmerLoading(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  error: (_, __) => const Center(
                    child: Text("Something went wrong"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
