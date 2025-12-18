import 'package:flutter/material.dart';
import 'package:flutter_core/features/home/presentation/views/widgets/category_grid.dart';
import 'package:flutter_core/features/home/presentation/views/widgets/section_grid.dart';
import 'package:flutter_core/features/home/presentation/views/widgets/slider_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_text.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(title: const CustomText("Home")),
      body: homeAsync.when(
        loading: () =>
        const Center(child: CircularProgressIndicator()),
        error: (_, __) =>
        const Center(child: Text("Something went wrong")),
        data: (data) {
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              HomeSlider(sliders: data["sliders"]),
              const SizedBox(height: 20),
              CategoryGrid(categories: data["categories"]),
              const SizedBox(height: 20),
              SectionGrid(sections: data["sections"]),
            ],
          );
        },
      ),
    );
  }
}
