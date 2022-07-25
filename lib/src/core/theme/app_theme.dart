import 'package:flutter/material.dart';

import 'app_dimension.dart';
import 'app_extension.dart';
import 'app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get defaultTheme => ThemeData(
        fontFamily: AppExtension.fontFamily,
        scaffoldBackgroundColor: AppExtension.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.infinity,
              AppDimension.size_5,
            ),
            textStyle: AppFonts.bodyLarge(),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppExtension.primary,
          secondary: AppExtension.secondary,
        ),
      );
}
