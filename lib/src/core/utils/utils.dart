import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_colors.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';

class Utils {
  Utils._();

  static Color getLuminance(Color color) =>
      color.computeLuminance() > 0.5 ? AppExtension.textColor : AppColors.white;

  static T getArgs<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
