import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../app_theme.dart';

enum TypeTheme {
  dark,
  light;

  bool get isDart {
    return this == dark;
  }
}

@lazySingleton
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_getInitialTheme());

  bool get isDark => AppTheme.isDark;

  static ThemeData _getInitialTheme() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    AppTheme.isDark = brightness == Brightness.dark;
    return AppTheme().currentTheme;
  }

  void toggleTheme() {
    AppTheme.isDark = !AppTheme.isDark;
    emit(AppTheme().currentTheme);
  }

  void setTheme(TypeTheme type) {
    AppTheme.isDark = type.isDart;
    emit(AppTheme().currentTheme);
  }
}
