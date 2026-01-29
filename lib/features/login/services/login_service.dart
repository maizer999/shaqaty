import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/login_response.dart';

class LoginUserService {
  final NetworkHandler _network = NetworkHandler();

  Future<Result<LoginResponse, AppException>> loginUserService({
    required String username,
    required String password,
  }) async {
    final requestBody = {
      'email': username,
      'password': password,
    };

    try {

      return await _network.executeApiCall(() async {
        final response = await _network.postRequest(
          endpoint: ApiUrls.login,
          data: requestBody,
          headers: await _network.getFormUrlencodedHeaders(),
        );

        // Extract data from Dio Response
        final Map<String, dynamic> jsonResponse = response.data;

        final loginResponse = LoginResponseMapper.fromMap(jsonResponse);

        return Success(loginResponse);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (_) {
      return Error(ServerErrorException());
    }
  }

}


final loginUserServiceProvider =
Provider.autoDispose<LoginUserService>(
      (ref) => LoginUserService(),
);