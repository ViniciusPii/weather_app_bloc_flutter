import 'package:flutter/material.dart';

import '/src/core/theme/app_styles.dart';
import '/src/core/theme/infra/app_dimension.dart';
import 'three_bounce_component.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({
    super.key,
    required this.loading,
    required this.child,
    this.size,
    this.color = AppStyles.primary,
    this.height,
  });

  final Color? color;
  final bool loading;
  final double? size;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      replacement: child,
      child: SizedBox(
        height: height ?? AppDimension.jumbo,
        child: ThreeBounceComponent(
          color: color,
          size: size ?? AppDimension.big,
        ),
      ),
    );
  }
}
