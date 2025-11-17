import 'package:flutter/material.dart';

class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  final TextStyle? title;
  final TextStyle? body;
  final TextStyle? caption;

  const TextThemeExtension({required this.title, required this.body, required this.caption});

  @override
  ThemeExtension<TextThemeExtension> lerp(
    covariant ThemeExtension<TextThemeExtension>? other,
    double t,
  ) {
    if (other is! TextThemeExtension) return this;
    return TextThemeExtension(
      title: TextStyle.lerp(title, other.title, t),
      body: TextStyle.lerp(body, other.body, t),
      caption: TextStyle.lerp(caption, other.caption, t),
    );
  }

  @override
  ThemeExtension<TextThemeExtension> copyWith({
    TextStyle? title,
    TextStyle? body,
    TextStyle? caption,
  }) {
    return TextThemeExtension(
      title: title ?? this.title,
      body: body ?? this.body,
      caption: caption ?? this.caption,
    );
  }
}
