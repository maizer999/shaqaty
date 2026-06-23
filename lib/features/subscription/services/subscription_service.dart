import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/network/network_handler.dart';
import '../models/package_model.dart';

/// Talks to the eClassify subscription/payment endpoints.
///
/// Every method returns a [Result] so callers can branch on success/error the
/// same way the rest of the app does (see `LoginUserService`).
class SubscriptionService {
  final NetworkHandler _network = NetworkHandler();

  Future<Map<String, String>> _headers() async {
    return {
      ...await NetworkHandler.getCommonHeaders(),
      'Accept': 'application/json',
    };
  }

  Future<Map<String, String>> _postHeaders() async {
    return {
      ...await NetworkHandler.getCommonPostHeaders(),
      'Accept': 'application/json',
    };
  }

  /// Throws an [AppException] carrying the API `message` when the standard
  /// `{ "error": true, ... }` envelope reports a failure.
  void _ensureNoApiError(Map<String, dynamic> body) {
    if (body['error'] == true) {
      throw AppException(message: body['message']?.toString());
    }
  }

  /// `GET /get-package?type=item_listing`
  Future<Result<List<PackageModel>, AppException>> getPackages() async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.getRequest(
          endpoint: ApiUrls.getPackage,
          params: {'type': 'item_listing'},
          headers: await _headers(),
        );

        final body = Map<String, dynamic>.from(response.data as Map);
        _ensureNoApiError(body);

        final rawList = (body['data'] as List?) ?? const [];
        final packages = rawList
            .map((e) => PackageModelMapper.fromMap(
                  Map<String, dynamic>.from(e as Map),
                ))
            .toList();

        return Success(packages);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (e, st) {
      log('getPackages failed: $e', stackTrace: st);
      return Error(ServerErrorException(response: {'message': e.toString()}));
    }
  }

  /// `GET /get-payment-settings` → returns the Stripe publishable key
  /// (`data.Stripe.api_key`), or null when Stripe is not configured.
  Future<Result<String?, AppException>> getStripePublishableKey() async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.getRequest(
          endpoint: ApiUrls.paymentSettings,
          headers: await _headers(),
        );

        final body = Map<String, dynamic>.from(response.data as Map);
        _ensureNoApiError(body);

        final data = body['data'];
        String? key;
        if (data is Map && data['Stripe'] is Map) {
          key = (data['Stripe'] as Map)['api_key']?.toString();
        }
        return Success(key);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (e, st) {
      log('getStripePublishableKey failed: $e', stackTrace: st);
      return Error(ServerErrorException(response: {'message': e.toString()}));
    }
  }

  /// `POST /assign-free-package` — used only for FREE packages
  /// (`final_price == 0`).
  Future<Result<bool, AppException>> assignFreePackage(int packageId) async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.postRequest(
          endpoint: ApiUrls.assignFreePackage,
          data: {'package_id': packageId},
          headers: await _postHeaders(),
        );

        final body = Map<String, dynamic>.from(response.data as Map);
        _ensureNoApiError(body);
        return const Success(true);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (e, st) {
      log('assignFreePackage failed: $e', stackTrace: st);
      return Error(ServerErrorException(response: {'message': e.toString()}));
    }
  }

  /// `POST /payment-intent` — used for PAID packages. Returns the Stripe
  /// client secret to drive the PaymentSheet.
  Future<Result<String, AppException>> createPaymentIntent(
      int packageId) async {
    try {
      return await _network.executeApiCall(() async {
        final response = await _network.postRequest(
          endpoint: ApiUrls.paymentIntent,
          data: {
            'payment_method': 'Stripe',
            'package_id': packageId,
          },
          headers: await _postHeaders(),
        );

        final body = Map<String, dynamic>.from(response.data as Map);
        _ensureNoApiError(body);

        final clientSecret = body['data']?['payment_intent']
            ?['payment_gateway_response']?['client_secret'];

        if (clientSecret is! String || clientSecret.isEmpty) {
          throw AppException(message: 'somethingWentWrong');
        }
        return Success(clientSecret);
      });
    } on AppException catch (e) {
      return Error(e);
    } catch (e, st) {
      log('createPaymentIntent failed: $e', stackTrace: st);
      return Error(ServerErrorException(response: {'message': e.toString()}));
    }
  }
}

final subscriptionServiceProvider = Provider.autoDispose<SubscriptionService>(
  (ref) => SubscriptionService(),
);