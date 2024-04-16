import 'package:flutter/material.dart';

import 'app_styles.dart';
import 'infra/app_colors.dart';
import 'infra/app_dimension.dart';
import 'infra/app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get defaultTheme => ThemeData(
        fontFamily: AppStyles.fontFamily,
        scaffoldBackgroundColor: AppStyles.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.infinity,
              AppDimension.mega,
            ),
            textStyle: AppFonts.bodyLarge(),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          isDense: true,
          fillColor: AppColors.neutral100,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppDimension.medium,
            horizontal: AppDimension.medium,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppStyles.primary,
          secondary: AppStyles.secondary,
        ),
        useMaterial3: false,
      );
}
