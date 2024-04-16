import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_colors.dart';
import '/src/core/ui/components/snack_bar/enums/snack_bar_type.dart';

class SnackBarConfig {
  SnackBarConfig({
    required this.color,
    required this.icon,
  });

  final Color color;
  final Icon icon;

  static SnackBarConfig getSnackBarConfig(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return SnackBarConfig(
          color: AppColors.neutral800,
          icon: const Icon(
            Icons.warning_rounded,
            color: AppColors.white,
          ),
        );
      case SnackBarType.success:
        return SnackBarConfig(
          color: AppColors.green,
          icon: const Icon(
            Icons.check_circle_rounded,
            color: AppColors.white,
          ),
        );
      case SnackBarType.error:
        return SnackBarConfig(
          color: AppColors.red,
          icon: const Icon(
            Icons.dangerous_rounded,
            color: AppColors.white,
          ),
        );
    }
  }
}
