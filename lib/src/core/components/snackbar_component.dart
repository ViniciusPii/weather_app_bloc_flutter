import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_colors.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';

enum SnackBarType {
  info,
  error,
  success,
}

final _snackBarType = <SnackBarType, dynamic>{
  SnackBarType.info: {
    'color': AppColors.neutral800,
    'icon': const Icon(
      FontAwesomeIcons.triangleExclamation,
      color: AppColors.white,
    )
  },
  SnackBarType.success: {
    'color': AppColors.green,
    'icon': const Icon(
      FontAwesomeIcons.solidCircleCheck,
      color: AppColors.white,
    )
  },
  SnackBarType.error: {
    'color': AppColors.red,
    'icon': const Icon(
      FontAwesomeIcons.solidCircleXmark,
      color: AppColors.white,
    )
  },
};

class SnackbarComponent {
  SnackbarComponent._();

  static _build(
    BuildContext context, {
    required SnackBarType type,
    required String message,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            _snackBarType[type]['icon'],
            const SizedBox(
              width: AppDimension.size_1,
            ),
            Flexible(
              child: Text(
                message,
                style: AppFonts.bodyLarge(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _snackBarType[type]['color'],
      ),
    );
  }

  static success(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.success, message: message);

  static error(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.error, message: message);

  static info(BuildContext context, {required String message}) =>
      _build(context, type: SnackBarType.info, message: message);
}
