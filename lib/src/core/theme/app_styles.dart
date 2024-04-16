import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'infra/app_colors.dart';

class AppStyles {
  AppStyles._();

  //Colors
  static const Color primary = AppColors.neutral800;
  static const Color primaryDark = AppColors.neutral800;
  static const Color primaryLight = AppColors.neutral100;
  static const Color secondary = AppColors.neutral100;
  static const Color background = AppColors.white;

  //Text Color
  static const Color textColor = AppColors.neutral800;
  static const Color textLightColor = AppColors.neutral600;

  //Font
  static final String? fontFamily = GoogleFonts.montserrat().fontFamily;
}
