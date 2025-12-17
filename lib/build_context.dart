import 'package:flutter/material.dart';
import 'package:flutter_core/user_managment/home/widgets/app_theme.dart';

extension CustomContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  //This one for colorScheme shortcut
  ColorScheme get color => Theme.of(this).colorScheme;

  //This one for fontSize
  ///I created different Font class to limit textTheme values, let's assume if some one is using context.font and he is getting too may options related to text theme so how will he know which one is for use??
  ///So in theme.dart file i have created Font class which will give limited numbers of getters
}


extension ThemeShortcuts on BuildContext {
  /// Usage: context.font.large
  FontSizes get font => TextThemeExtension(Theme.of(this).textTheme).font;

  /// Usage: context.colorScheme.primary
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}