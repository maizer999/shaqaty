import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/custom_text.dart';
import '../models/package_model.dart';
import 'controller/subscription_provider.dart';
import 'widgets/package_card.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  Future<void> _onSubscribe(
    BuildContext context,
    WidgetRef ref,
    PackageModel pkg,
  ) async {
    final result = await ref.read(subscriptionProvider.notifier).subscribe(pkg);
    if (!context.mounted) return;

    switch (result.status) {
      case SubscribeStatus.success:
        _showSnack(context, (result.message ?? 'paymentSuccessful').tr(),
            isError: false);
        break;
      case SubscribeStatus.error:
        _showSnack(context, _resolveMessage(result.message), isError: true);
        break;
      case SubscribeStatus.cancelled:
        break;
    }
  }

  /// Error messages may be a translation key or a raw API string.
  String _resolveMessage(String? message) {
    if (message == null || message.isEmpty) return 'somethingWentWrong'.tr();
    final translated = message.tr();
    return translated == message && !message.contains(' ')
        ? 'somethingWentWrong'.tr()
        : translated;
  }

  void _showSnack(BuildContext context, String message, {required bool isError}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: CustomText(message, color: Colors.white),
          backgroundColor: isError ? Colors.red.shade600 : Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagesAsync = ref.watch(subscriptionProvider);
    final processingId = ref.watch(subscriptionProcessingProvider);

    return Scaffold(
      appBar: AppBar(
        title: CustomText('subscriptionPackages'.tr(),
            fontWeight: FontWeight.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: packagesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorView(
          message: _resolveMessage(error.toString()),
          onRetry: () => ref.read(subscriptionProvider.notifier).reload(),
        ),
        data: (packages) {
          if (packages.isEmpty) {
            return Center(child: CustomText('noPackagesFound'.tr()));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(subscriptionProvider.notifier).reload(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final pkg = packages[index];
                return PackageCard(
                  package: pkg,
                  isProcessing: processingId == pkg.id,
                  // Disable every button while any request is in flight.
                  onPressed: processingId != null
                      ? null
                      : () => _onSubscribe(context, ref, pkg),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            CustomText(message, textAlign: TextAlign.center, color: Colors.grey),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: CustomText('retry'.tr(), color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}