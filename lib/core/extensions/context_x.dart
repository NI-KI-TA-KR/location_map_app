import 'package:flutter/material.dart';

import '../theme/theme.dart';

extension ContextExtension on BuildContext {
  T themeExtension<T>() {
    return Theme.of(this).extension<T>()!;
  }

  ColorSchemeThemeExtension get colorSchemeExtension => themeExtension<ColorSchemeThemeExtension>();

  TextThemeExtension get textThemeExtension => themeExtension<TextThemeExtension>();
}
