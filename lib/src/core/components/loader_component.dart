import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/components/three_bounce_component.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({
    super.key,
    required this.loading,
    required this.child,
    this.size,
    this.color = AppExtension.primary,
  });

  final Color? color;
  final bool loading;
  final double? size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      replacement: child,
      child: SizedBox(
        height: AppDimension.size_6,
        child: ThreeBounceComponent(
          color: color,
          size: size ?? AppDimension.size_4,
        ),
      ),
    );
  }
}
