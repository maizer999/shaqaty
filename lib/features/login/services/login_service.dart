import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/login_response.dart';

class LoginUserService {

  Future<Result<LoginResponse, AppException>> loginUserService({
    String? username,
    String? password,
  }) async {
    final requestBody = {
      'username': username,
      'password': password,
    };

    try {
      return await NetworkHandler.executeApiCall(() async {
        final jsonResponse = await NetworkHandler.postRequest(
          headers: await NetworkHandler.getFormUrlencodedHeaders(),
          endpoint: '/login',
          data: requestBody,
        );

        final response = LoginResponseMapper.fromMap(jsonResponse);
        return Success(response);
      });
    } catch (e) {
      return Error(e as AppException);
    }
  }
}


final loginUserServiceProvider =
Provider.autoDispose<LoginUserService>(
      (ref) => LoginUserService(),
);