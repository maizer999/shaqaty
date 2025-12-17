// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme.dart';
import 'hive_utils.dart';


class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit() : super(AppTheme.light) {
    final currentTheme = HiveUtils.getCurrentTheme();
    if (state != currentTheme) {
      emit(currentTheme);
    }
  }

  void toggleTheme() {
    final toggledTheme =
        state == AppTheme.light ? AppTheme.dark : AppTheme.light;
    HiveUtils.setCurrentTheme(toggledTheme);
    emit(toggledTheme);
  }

  bool isDarkMode() {
    return state == AppTheme.dark;
  }
}
