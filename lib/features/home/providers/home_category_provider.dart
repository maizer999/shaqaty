import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/slider_response.dart';
import '../service/home_services.dart';

/// =======================
/// Home Slider Provider
/// =======================

class HomeSliderNotifier
    extends AutoDisposeAsyncNotifier<List<HomeSliderItem>> {
  @override
  FutureOr<List<HomeSliderItem>> build() async {
    final service = ref.watch(homeServiceProvider);

    final result = await service.getHomeSlider();

    return result.when(
          (successData) => successData,
          (error) => throw error,
    );
  }
}

final homeSliderProvider = AsyncNotifierProvider.autoDispose<
    HomeSliderNotifier, List<HomeSliderItem>>(
  HomeSliderNotifier.new,
  name: 'homeSliderProvider',
);
