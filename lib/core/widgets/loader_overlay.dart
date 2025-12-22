import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/theme/theme.dart';

import '../theme/ui_utils.dart';

class LoadingWidgets {
  static bool isLoadingShowing = false;
  static void showLoader(BuildContext context) async {
    if (isLoadingShowing) {
      return;
    }
    isLoadingShowing = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AnnotatedRegion(
          value: UiUtils.getSystemUiOverlayStyle(
            context: context,
            statusBarColor: Colors.black.withValues(alpha: 0),
          ),
          child: SafeArea(
            child: PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                return;
              },
              child: Center(
                child: UiUtils.progress(
                  normalProgressColor: context.color.territoryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoader(BuildContext context) {
    if (isLoadingShowing) {
      isLoadingShowing = false;
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }
}
