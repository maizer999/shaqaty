import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/payment/stripe_service.dart';
import '../../models/package_model.dart';
import '../../services/subscription_service.dart';

/// Outcome of a subscribe attempt, surfaced to the UI for SnackBars.
enum SubscribeStatus { success, cancelled, error }

class SubscribeResult {
  final SubscribeStatus status;

  /// Either a translation key (success cases) or a raw API message (errors).
  final String? message;

  const SubscribeResult(this.status, [this.message]);
}

/// Holds the id of the package whose request is currently in flight, so each
/// card can show its own loading state and disable buttons.
final subscriptionProcessingProvider = StateProvider.autoDispose<int?>(
  (ref) => null,
);

class SubscriptionNotifier
    extends AutoDisposeAsyncNotifier<List<PackageModel>> {
  bool _stripeReady = false;

  @override
  FutureOr<List<PackageModel>> build() async {
    // Configure Stripe in the background; don't block the package list on it.
    unawaited(_ensureStripeConfigured());
    return _fetchPackages();
  }

  Future<List<PackageModel>> _fetchPackages() async {
    final service = ref.read(subscriptionServiceProvider);
    final result = await service.getPackages();
    return result.when(
      (packages) => packages,
      (error) => throw error,
    );
  }

  /// Re-fetches the list and updates state (used after a successful subscribe).
  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchPackages);
  }

  /// Pulls the Stripe publishable key once and applies it to the SDK.
  Future<bool> _ensureStripeConfigured() async {
    if (_stripeReady && StripeService.isConfigured) return true;
    final service = ref.read(subscriptionServiceProvider);
    final result = await service.getStripePublishableKey();
    return result.when(
      (key) async {
        if (key == null || key.isEmpty) return false;
        await StripeService.configure(key);
        _stripeReady = true;
        return true;
      },
      (_) => false,
    );
  }

  /// Subscribes to [pkg]: free packages are granted directly, paid packages go
  /// through the Stripe PaymentSheet. On success the list is reloaded so
  /// `is_active` reflects the server state.
  Future<SubscribeResult> subscribe(PackageModel pkg) async {
    final id = pkg.id;
    if (id == null) {
      return const SubscribeResult(SubscribeStatus.error, 'somethingWentWrong');
    }

    final processing = ref.read(subscriptionProcessingProvider.notifier);
    processing.state = id;
    try {
      final service = ref.read(subscriptionServiceProvider);

      if (pkg.isFree) {
        final result = await service.assignFreePackage(id);
        return await result.when(
          (_) async {
            await reload();
            return const SubscribeResult(
                SubscribeStatus.success, 'packageActivated');
          },
          (error) async => SubscribeResult(SubscribeStatus.error, error.message),
        );
      }

      // Paid flow.
      await _ensureStripeConfigured();
      if (!StripeService.isConfigured) {
        return const SubscribeResult(
            SubscribeStatus.error, 'somethingWentWrong');
      }

      final intentResult = await service.createPaymentIntent(id);
      return await intentResult.when(
        (clientSecret) async {
          final paid = await StripeService.presentPaymentSheet(
            clientSecret: clientSecret,
          );
          if (!paid) {
            return const SubscribeResult(SubscribeStatus.cancelled);
          }
          // Payment is finalized server-side by the Stripe webhook; just
          // re-fetch and rely on is_active.
          await reload();
          return const SubscribeResult(
              SubscribeStatus.success, 'paymentSuccessful');
        },
        (error) async => SubscribeResult(SubscribeStatus.error, error.message),
      );
    } catch (e) {
      return SubscribeResult(SubscribeStatus.error, e.toString());
    } finally {
      // Provider may already be disposed if the screen closed mid-flight.
      ref.read(subscriptionProcessingProvider.notifier).state = null;
    }
  }
}

final subscriptionProvider = AutoDisposeAsyncNotifierProvider<
    SubscriptionNotifier, List<PackageModel>>(
  SubscriptionNotifier.new,
);