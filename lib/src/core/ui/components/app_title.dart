import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_fonts.dart';

enum TitleType {
  large,
  medium,
  small,
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    required this.title,
    this.type,
    this.color,
  });

  final String title;
  final Color? color;
  final TitleType? type;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: _changeEditTitle(
        type ?? TitleType.large,
      ),
    );
  }

  TextStyle _changeEditTitle(TitleType type) {
    switch (type) {
      case TitleType.large:
        return AppFonts.titleLarge(
          color: color,
        );
      case TitleType.medium:
        return AppFonts.titleMedium(
          color: color,
        );
      case TitleType.small:
        return AppFonts.titleSmall(
          color: color,
        );
    }
  }
}
