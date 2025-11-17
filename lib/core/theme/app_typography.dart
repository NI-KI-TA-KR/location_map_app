import 'package:flutter/material.dart';

abstract class AppTypography {
  static const _titleSize = 20.0;
  static const _bodySize = 17.0;

  static const _defaultStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 18 / 14,
  );

  static TextStyle get caption => _defaultStyle;

  static TextStyle get body => caption.copyWith(fontSize: _bodySize, height: 22 / _bodySize);

  static TextStyle get title => _defaultStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: _titleSize,
    height: 28 / _titleSize,
  );
}
