import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_dimension.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.medium,
        horizontal: AppDimension.large,
      ),
      child: child,
    );
  }
}
