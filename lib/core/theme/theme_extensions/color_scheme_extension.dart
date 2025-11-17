import 'package:flutter/material.dart';
import '../app_colors.dart';

class ColorSchemeThemeExtension extends ThemeExtension<ColorSchemeThemeExtension> {
  final Color title;
  final Color text;
  final Color switcherActive;
  final Color switcherIndicator;
  final Color switcherInActive;
  final Color appBar;
  final Color background;
  final Color white;

  const ColorSchemeThemeExtension({
    required this.title,
    required this.text,
    required this.switcherActive,
    required this.switcherIndicator,
    required this.switcherInActive,
    required this.appBar,
    required this.background,
    required this.white,
  });

  static const light = ColorSchemeThemeExtension(
    title: AppColors.black00,
    text: AppColors.grey8f,
    switcherActive: AppColors.red28,
    switcherIndicator: AppColors.whiteFF,
    switcherInActive: AppColors.grey8f,
    appBar: AppColors.background34,
    background: AppColors.whiteFF,
    white: AppColors.whiteFF,
  );

  static const dark = ColorSchemeThemeExtension(
    title: AppColors.whiteFF,
    text: AppColors.grey8f,
    switcherActive: AppColors.red28,
    switcherIndicator: AppColors.background1C,
    switcherInActive: AppColors.grey6f,
    appBar: AppColors.background34,
    background: AppColors.background34,
    white: AppColors.whiteFF,
  );

  @override
  ThemeExtension<ColorSchemeThemeExtension> lerp(
    covariant ThemeExtension<ColorSchemeThemeExtension>? other,
    double t,
  ) {
    if (other is! ColorSchemeThemeExtension) return this;

    return ColorSchemeThemeExtension(
      title: Color.lerp(title, other.title, t)!,
      text: Color.lerp(text, other.text, t)!,
      switcherActive: Color.lerp(switcherActive, other.switcherActive, t)!,
      switcherIndicator: Color.lerp(switcherIndicator, other.switcherIndicator, t)!,
      switcherInActive: Color.lerp(switcherInActive, other.switcherInActive, t)!,
      appBar: Color.lerp(appBar, other.appBar, t)!,
      background: Color.lerp(background, other.background, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }

  @override
  ColorSchemeThemeExtension copyWith({
    Color? title,
    Color? text,
    Color? switcherActive,
    Color? switcherIndicator,
    Color? switcherInActive,
    Color? appBar,
    Color? background,
    Color? white,
  }) {
    return ColorSchemeThemeExtension(
      title: title ?? this.title,
      text: text ?? this.text,
      switcherActive: switcherActive ?? this.switcherActive,
      switcherIndicator: switcherIndicator ?? this.switcherIndicator,
      switcherInActive: switcherInActive ?? this.switcherInActive,
      appBar: appBar ?? this.appBar,
      background: background ?? this.background,
      white: white ?? this.white,
    );
  }
}
