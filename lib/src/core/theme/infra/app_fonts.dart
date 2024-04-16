import 'package:flutter/material.dart';

import '/src/core/theme/app_styles.dart';

enum TextSize {
  smallSize(size: 11),
  mediumSmallSize(size: 12),
  mediumSize(size: 14),
  mediumLargeSize(size: 16),
  largeSize(size: 18),
  extraLargeSize(size: 24),
  hugeSize(size: 28),
  veryHugeSize(size: 32),
  giganticSize(size: 36),
  enormousSize(size: 45),
  humongousSize(size: 57);

  const TextSize({required this.size});

  final double size;
}

class AppFonts {
  AppFonts._();

  static const Color _colorDefault = AppStyles.textColor;
  static const Color _colorDefaultLight = AppStyles.textLightColor;

  static const FontWeight _normal = FontWeight.normal;
  static const FontWeight _medium = FontWeight.w600;

  static TextStyle _baseFonts({
    Color? color,
    bool? light,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: light == true ? _colorDefaultLight : color ?? _colorDefault,
      fontWeight: fontWeight ?? _normal,
      fontSize: fontSize,
      fontFamily: AppStyles.fontFamily,
    );
  }

  //Body
  static TextStyle bodySmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.mediumSmallSize.size,
      );

  static TextStyle bodyMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.mediumSize.size,
      );

  static TextStyle bodyLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.mediumLargeSize.size,
      );

  //Label
  static TextStyle labelSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.smallSize.size,
      );

  static TextStyle labelMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.mediumSmallSize.size,
      );

  static TextStyle labelLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.mediumSize.size,
      );

  //Title
  static TextStyle titleSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.mediumSize.size,
      );

  static TextStyle titleMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.mediumLargeSize.size,
      );

  static TextStyle titleLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: TextSize.largeSize.size,
      );

  //Headline
  static TextStyle headlineSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.extraLargeSize.size,
      );

  static TextStyle headlineMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.hugeSize.size,
      );

  static TextStyle headlineLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.veryHugeSize.size,
      );

  //Display
  static TextStyle displaySmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.giganticSize.size,
      );

  static TextStyle displayMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.enormousSize.size,
      );

  static TextStyle displayLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: TextSize.humongousSize.size,
      );
}
