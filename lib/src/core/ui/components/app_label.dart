import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_fonts.dart';

enum LabelType {
  large,
  medium,
  small,
}

class AppLabel extends StatelessWidget {
  const AppLabel({
    super.key,
    required this.label,
    this.type,
    this.color,
    this.isLight,
    this.isCenter,
    this.maxLines,
  });

  final String label;
  final Color? color;
  final int? maxLines;
  final bool? isLight;
  final bool? isCenter;
  final LabelType? type;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: _changeEditLabel(type ?? LabelType.large),
      textAlign: isCenter ?? true ? TextAlign.center : TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  TextStyle _changeEditLabel(LabelType type) {
    final bool light = (isLight ?? true) && (color == null);

    switch (type) {
      case LabelType.large:
        return AppFonts.bodyLarge(
          color: color,
          light: light,
        );
      case LabelType.medium:
        return AppFonts.bodyMedium(
          color: color,
          light: light,
        );
      case LabelType.small:
        return AppFonts.bodySmall(
          color: color,
          light: light,
        );
    }
  }
}
