import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/language/secure_storage.dart';
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

  Future<void> loginWithGoogle(String idToken) async {
    state = const AsyncValue.loading();

    final service = ref.read(loginUserServiceProvider);

    final result = await service.loginWithGoogleService(idToken: idToken);

    result.when(
          (loginResponse) {
        // 1. Store the Sanctum token from your Laravel response
        final token = loginResponse.meta?.token;
        if (token != null) {
          // Assuming you have a secure storage helper
          SecureStorageHelper.setAccessToken(token);
        }

        // 2. Update state to trigger navigation in UI
        state = AsyncValue.data(loginResponse);
      },
          (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> loginWithFacebook(String accessToken) async {
    state = const AsyncValue.loading();
    final service = ref.read(loginUserServiceProvider);

    final result = await service.loginWithFacebookService(accessToken: accessToken);

    result.when(
          (loginResponse) async {
        // FIXED: Changed loginResponse.data?.token to loginResponse.token
        final token = loginResponse.meta?.token;;

        if (token != null) {
          await SecureStorageHelper.setAccessToken(token);
        }
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


