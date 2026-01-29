import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/sub_category_response.dart';

class SubCategoryService {
  final NetworkHandler _network = NetworkHandler();

  Future<Result<List<SubCategoryItem>, AppException>> getSubCategories({
    required int categoryId,
    int page = 1,
    String search = '',
  }) async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.getRequest(
          endpoint: '${ApiUrls.items}?category_id=$categoryId&page=$page&search=$search',
          headers: await _network.getFormUrlencodedHeaders(),
        );

        // Map JSON to SubCategoryResponse
        final subCategoryResponse = SubCategoryResponseMapper.fromMap(response.data);

        // Extract the list of SubCategoryItem
        final categories = subCategoryResponse.data?.data ?? [];

        return Success(categories);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }
}

// Provider
final subCategoryServiceProvider =
Provider.autoDispose<SubCategoryService>((ref) => SubCategoryService());
