import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// Thin wrapper around [flutter_stripe] so the rest of the app never touches
/// the Stripe SDK directly.
///
/// The publishable key is not known at app start (it comes from the authed
/// `GET /get-payment-settings` endpoint), so [configure] is called lazily the
/// first time the subscription flow needs it.
class StripeService {
  StripeService._();

  static const String _merchantDisplayName = 'Shaqaty';

  static String? _configuredKey;

  /// Whether a publishable key has already been applied to the SDK.
  static bool get isConfigured =>
      _configuredKey != null && _configuredKey!.isNotEmpty;

  /// Sets the Stripe publishable key and applies the settings. Safe to call
  /// repeatedly; it only re-applies when the key actually changes.
  static Future<void> configure(String publishableKey) async {
    if (publishableKey.isEmpty) return;
    if (_configuredKey == publishableKey) return;

    Stripe.publishableKey = publishableKey;
    _configuredKey = publishableKey;
    try {
      await Stripe.instance.applySettings();
    } catch (e) {
      if (kDebugMode) print('Stripe.applySettings failed: $e');
    }
  }

  /// Presents the native PaymentSheet for the given [clientSecret].
  ///
  /// Returns `true` when the user completed the payment, `false` when they
  /// cancelled. Throws for any unexpected Stripe error so the caller can show
  /// the message.
  static Future<bool> presentPaymentSheet({
    required String clientSecret,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: _merchantDisplayName,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      return true;
    } on StripeException catch (e) {
      // User dismissed the sheet → treat as a non-error cancellation.
      if (e.error.code == FailureCode.Canceled) {
        return false;
      }
      rethrow;
    }
  }
}