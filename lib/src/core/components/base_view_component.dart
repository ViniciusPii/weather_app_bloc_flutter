import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';

class BaseViewComponent extends StatelessWidget {
  const BaseViewComponent({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.size_2,
          horizontal: AppDimension.size_3,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
