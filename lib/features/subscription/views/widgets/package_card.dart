import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../models/package_model.dart';

/// A single subscription package card with name, price, duration, item limit
/// and a context-aware action button.
class PackageCard extends StatelessWidget {
  final PackageModel package;
  final bool isProcessing;

  /// Disabled when null (e.g. the package is already active).
  final VoidCallback? onPressed;

  const PackageCard({
    super.key,
    required this.package,
    required this.isProcessing,
    required this.onPressed,
  });

  bool get _isUnlimited => (package.duration ?? '').toLowerCase() == 'unlimited';

  String get _durationLabel => _isUnlimited
      ? 'unlimited'.tr()
      : '${package.duration ?? '-'} ${'days'.tr()}';

  String get _itemLimitLabel =>
      (package.itemLimit ?? '').toLowerCase() == 'unlimited'
          ? 'unlimited'.tr()
          : (package.itemLimit ?? '-');

  String get _priceLabel => package.isFree
      ? 'free'.tr()
      : (package.finalPrice ?? 0).toString();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final isActive = package.active;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? primary : theme.dividerColor.withOpacity(0.15),
          width: isActive ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  package.displayName,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CustomText(
                _priceLabel,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _infoRow(
            context,
            icon: Icons.schedule_rounded,
            label: 'duration'.tr(),
            value: _durationLabel,
          ),
          const SizedBox(height: 6),
          _infoRow(
            context,
            icon: Icons.list_alt_rounded,
            label: 'itemLimit'.tr(),
            value: _itemLimitLabel,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (isActive || isProcessing) ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? Colors.grey.shade400 : primary,
                disabledBackgroundColor:
                    isActive ? Colors.green.shade400 : Colors.grey.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isProcessing
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : CustomText(
                      _buttonLabel(),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String _buttonLabel() {
    if (package.active) return 'active'.tr();
    if (package.isFree) return 'activate'.tr();
    return 'subscribe'.tr();
  }

  Widget _infoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 8),
        CustomText('$label: ', color: Colors.grey, fontSize: 13),
        Expanded(
          child: CustomText(
            value,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}