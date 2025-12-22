import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/login_response.dart';
import '../../services/login_service.dart';


class LoginUserNotifier
    extends AutoDisposeAsyncNotifier<LoginResponse?> {
  @override
  FutureOr<LoginResponse?> build() {
    return null; // initial state
  }

  Future<void> loginUser({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final service = ref.read(loginUserServiceProvider);

    final result = await service.loginUserService(
      username: username,
      password: password,
    );

    result.when(
          (loginResponse) {
        // Access token if needed
        final token = loginResponse.meta?.token;

        // Store token here if you want

        state = AsyncValue.data(loginResponse);
      },
          (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

final loginUserProvider =
AutoDisposeAsyncNotifierProvider<LoginUserNotifier, LoginResponse?>(
  LoginUserNotifier.new,
);


