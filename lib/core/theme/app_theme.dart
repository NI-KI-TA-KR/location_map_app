import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/assets_gen/fonts.gen.dart';
import 'package:test_flutter_map/core/theme/border_radius_constants.dart';
import 'package:test_flutter_map/core/theme/theme.dart';

class AppTheme {
  const AppTheme();

  static bool isDark = true;

  String get mapStyle {
    if (isDark) return _darkMapStyle;
    return _lightMapStyle;
  }

  final String _lightMapStyle =
      'https://api.maptiler.com/maps/darkmatter/{z}/{x}/{y}.png?key=mwq1vVxI02NvVeaIGrai';
  final String _darkMapStyle =
      'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=mwq1vVxI02NvVeaIGrai';

  ThemeData get currentTheme => isDark ? darkTheme : lightTheme;

  ThemeData get lightTheme {
    final colorScheme = lightColorScheme;
    final colorSchemeExtension = lightColorSchemeExtension;
    final textThemeExtension = lightTextThemeExtension;

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: FontFamily.inter,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (_) =>
            Icon(FluentIcons.ios_arrow_24_filled, color: colorSchemeExtension.text),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorSchemeExtension.appBar,
        titleTextStyle: textThemeExtension.title!.copyWith(color: colorScheme.onPrimary),
        titleSpacing: 0,
        actionsIconTheme: IconThemeData(color: colorSchemeExtension.text),
        toolbarHeight: 64,
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(shape: _defaultButtonShape)),
      extensions: [colorSchemeExtension, textThemeExtension],
    );
  }

  ThemeData get darkTheme {
    final colorScheme = darkColorScheme;
    final colorSchemeExtension = darkColorSchemeExtension;
    final textThemeExtension = darkTextThemeExtension;

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: FontFamily.inter,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (_) =>
            Icon(FluentIcons.ios_arrow_24_filled, color: colorSchemeExtension.text),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorSchemeExtension.appBar,
        titleTextStyle: textThemeExtension.title,
        titleSpacing: 0,
        actionsIconTheme: IconThemeData(color: colorSchemeExtension.text),
        elevation: 1,
        toolbarHeight: 64,
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(shape: _defaultButtonShape)),
      extensions: [colorSchemeExtension, textThemeExtension],
    );
  }

  ColorScheme get lightColorScheme {
    return const ColorScheme.light(
      primary: AppColors.red28,
      onPrimary: AppColors.whiteFF,
      secondary: AppColors.grey74,
      onSecondary: AppColors.whiteFF,
      surface: AppColors.whiteFF,
      onSurface: AppColors.black00,
      error: AppColors.red28,
      onError: AppColors.red28,
      outline: AppColors.grey74,
    );
  }

  ColorScheme get darkColorScheme {
    return const ColorScheme.light(
      primary: AppColors.red28,
      onPrimary: AppColors.background1C,
      secondary: AppColors.grey8f,
      onSecondary: AppColors.background1C,
      surface: AppColors.background1C,
      onSurface: AppColors.black00,
      error: AppColors.red28,
      onError: AppColors.red28,
      outline: AppColors.grey8f,
    );
  }

  ColorSchemeThemeExtension get lightColorSchemeExtension => ColorSchemeThemeExtension.light;
  ColorSchemeThemeExtension get darkColorSchemeExtension => ColorSchemeThemeExtension.dark;

  TextThemeExtension get lightTextThemeExtension {
    return TextThemeExtension(
      body: AppTypography.body.copyWith(color: lightColorSchemeExtension.title),
      title: AppTypography.title.copyWith(color: lightColorSchemeExtension.title),
      caption: AppTypography.caption.copyWith(color: lightColorSchemeExtension.text),
    );
  }

  TextThemeExtension get darkTextThemeExtension {
    return TextThemeExtension(
      body: AppTypography.body.copyWith(color: darkColorSchemeExtension.title),
      title: AppTypography.title.copyWith(color: darkColorSchemeExtension.title),
      caption: AppTypography.caption.copyWith(color: darkColorSchemeExtension.text),
    );
  }

  static const _defaultButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadiusConstants.circular8,
  );
}
