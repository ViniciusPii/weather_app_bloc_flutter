import 'dart:developer' as log;
import 'dart:math';

import 'package:flutter/material.dart';

class AppColorGenerate {
  AppColorGenerate._();

  static MaterialColor color(int color) {
    return MaterialColor(
      Color(color).value,
      <int, Color>{
        //shades 25%
        50: tintColor(Color(color), 0.95),
        100: tintColor(Color(color), 0.9),
        200: tintColor(Color(color), 0.75),
        300: tintColor(Color(color), 0.5),
        400: tintColor(Color(color), 0.25),
        500: Color(color),
        600: shadeColor(Color(color), 0.2),
        700: shadeColor(Color(color), 0.4),
        800: shadeColor(Color(color), 0.6),
        900: shadeColor(Color(color), 0.8),

        // ligh shades
        // 50: tintColor(Color(color), 0.874),
        // 100: tintColor(Color(color), 0.8),
        // 200: tintColor(Color(color), 0.6),
        // 300: tintColor(Color(color), 0.4),
        // 400: tintColor(Color(color), 0.2),
        // 500: Color(color),
        // 600: shadeColor(Color(color), 0.1),
        // 700: shadeColor(Color(color), 0.2),
        // 800: shadeColor(Color(color), 0.3),
        // 900: shadeColor(Color(color), 0.4),
      },
    );
  }

  static generateLog({required int hexa, required String colorName}) {
    List<int> shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    MaterialColor colorLog = color(hexa);

    // log.log('''
    //   static MaterialColor $colorName = const MaterialColor(
    //     $hexa,
    //     {
    //       50: ${colorLog[shades[0]]},
    //       100: ${colorLog[shades[1]]},
    //       200: ${colorLog[shades[2]]},
    //       300: ${colorLog[shades[3]]},
    //       400: ${colorLog[shades[4]]},
    //       500: ${colorLog[shades[5]]},
    //       600: ${colorLog[shades[6]]},
    //       700: ${colorLog[shades[7]]},
    //       800: ${colorLog[shades[8]]},
    //       900: ${colorLog[shades[9]]},
    //     },
    //   );
    // ''');

    log.log('static const Color $colorName = ${colorLog[shades[5]]};');
    for (int i = 0; i < shades.length; i++) {
      log.log('static const Color $colorName${shades[i]} = ${colorLog[shades[i]]};');
    }
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(tintValue(color.red, factor),
      tintValue(color.green, factor), tintValue(color.blue, factor), 1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
