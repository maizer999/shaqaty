import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../data/models/category_response.dart';
import '../data/models/slider_response.dart';

class HomeService {
  final NetworkHandler _network = NetworkHandler();

  /// =======================
  /// Get Categories
  /// =======================
  Future<Result<List<CategoryItem>, AppException>> getCategories({
    int page = 1,
  }) async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.getRequest(
          endpoint:
          'https://admin.shaqaty.com/api/get-categories?page=$page',
          headers: await _network.getFormUrlencodedHeaders(),
        );

        final categoryResponse =
        CategoryResponseMapper.fromMap(response.data);

        final categories = categoryResponse.data?.data ?? [];

        return Success(categories);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }

  /// =======================
  /// Get Home Slider
  /// =======================
  Future<Result<List<HomeSliderItem>, AppException>> getHomeSlider() async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.getRequest(
          endpoint: 'https://admin.shaqaty.com/api/get-slider',
          headers: await _network.getFormUrlencodedHeaders(),
        );

        final sliderResponse =
        HomeSliderResponseMapper.fromMap(response.data);

        final sliders = sliderResponse.data ?? [];

        return Success(sliders);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }
}

/// =======================
/// Provider
/// =======================
final homeServiceProvider =
Provider.autoDispose<HomeService>((ref) => HomeService());
