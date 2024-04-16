import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_colors.dart';
import '/src/core/theme/infra/app_dimension.dart';
import '/src/core/theme/infra/app_fonts.dart';
import '/src/core/ui/components/snack_bar/base_snack_bar_component.dart';
import '/src/core/ui/components/snack_bar/enums/snack_bar_position.dart';
import '/src/core/ui/components/snack_bar/enums/snack_bar_type.dart';
import '/src/core/ui/components/snack_bar/snack_bar_config.dart';

class SnackBarComponent {
  SnackBarComponent._();

  static const double _snackBarWidthPadding = 10.0;
  static const double _snackBarHeightPadding = 12.0;

  static void _build(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    SnackBarPosition? position = SnackBarPosition.top,
  }) {
    BaseSnackBarComponent.show(
      context,
      positionTop: position == SnackBarPosition.top ? 0 : null,
      positionBottom: position == SnackBarPosition.bottom ? 0 : null,
      child: Padding(
        padding: const EdgeInsets.all(AppDimension.large),
        child: Container(
          decoration: BoxDecoration(
            color: SnackBarConfig.getSnackBarConfig(type).color,
            borderRadius: BorderRadius.circular(AppDimension.small),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: _snackBarHeightPadding,
              horizontal: _snackBarWidthPadding,
            ),
            child: Row(
              children: [
                SnackBarConfig.getSnackBarConfig(type).icon,
                const SizedBox(
                  width: AppDimension.medium,
                ),
                Flexible(
                  child: Text(
                    message,
                    style: AppFonts.bodyLarge(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    SnackBarPosition? position,
  }) =>
      _build(
        context,
        message: message,
        position: position,
        type: SnackBarType.success,
      );

  static void error(
    BuildContext context, {
    required String message,
    SnackBarPosition? position,
  }) =>
      _build(
        context,
        message: message,
        position: position,
        type: SnackBarType.error,
      );

  static void info(
    BuildContext context, {
    required String message,
    SnackBarPosition? position,
  }) =>
      _build(
        context,
        message: message,
        position: position,
        type: SnackBarType.info,
      );
}
