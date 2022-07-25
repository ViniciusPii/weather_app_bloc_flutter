import 'package:flutter/material.dart';

import 'app_extension.dart';

class AppFonts {
  AppFonts._();

  static const Color _colorDefault = AppExtension.textColor;
  static const Color _colorDefaultLight = AppExtension.textLightColor;

  static const FontWeight _normal = FontWeight.normal;
  static const FontWeight _medium = FontWeight.w600;

  static const double _dimension0 = 11;
  static const double _dimension1 = 12;
  static const double _dimension2 = 14;
  static const double _dimension3 = 16;
  static const double _dimension4 = 18;
  static const double _dimension5 = 24;
  static const double _dimension6 = 28;
  static const double _dimension7 = 32;
  static const double _dimension8 = 36;
  static const double _dimension9 = 45;
  static const double _dimension10 = 57;

  static TextStyle _baseFonts({
    Color? color,
    bool? light,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: _getColor(color, light ?? false),
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: AppExtension.fontFamily,
    );
  }

  static Color _getColor(Color? color, bool light) {
    if (light) {
      return _colorDefaultLight;
    } else if (color == null) {
      return _colorDefault;
    }

    return color;
  }

  //Body
  static TextStyle bodySmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension1,
      );

  static TextStyle bodyMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension2,
      );

  static TextStyle bodyLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension3,
      );

  //Label
  static TextStyle labelSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension0,
      );

  static TextStyle labelMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension1,
      );

  static TextStyle labelLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension2,
      );

  //Title
  static TextStyle titleSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension2,
      );

  static TextStyle titleMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension3,
      );

  static TextStyle titleLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _medium,
        fontSize: _dimension4,
      );

  //Headline
  static TextStyle headlineSmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension5,
      );

  static TextStyle headlineMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension6,
      );

  static TextStyle headlineLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension7,
      );

  //Display
  static TextStyle displaySmall({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension8,
      );

  static TextStyle displayMedium({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension9,
      );

  static TextStyle displayLarge({Color? color, bool? light}) => _baseFonts(
        color: color,
        light: light,
        fontWeight: _normal,
        fontSize: _dimension10,
      );
}
