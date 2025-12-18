import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

extension CustomContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  ColorScheme get color => Theme.of(this).colorScheme;

}


extension ThemeShortcuts on BuildContext {
  /// Usage: context.font.large
  FontSizes get font => TextThemeExtension(Theme.of(this).textTheme).font;

  /// Usage: context.colorScheme.primary
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}