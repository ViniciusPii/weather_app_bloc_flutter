import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/components/base_view_component.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    Key? key,
    required this.title,
    required this.info,
    required this.fun,
  }) : super(key: key);

  final String info;
  final String title;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return BaseViewComponent(
      children: [
        const Icon(
          Icons.warning_amber_rounded,
          size: AppDimension.size_5,
          color: AppExtension.primary,
        ),
        AppDimension.spacing_2,
        Text(
          title,
          style: AppFonts.titleLarge(),
        ),
        AppDimension.spacing_0,
        Text(
          info,
          style: AppFonts.bodyLarge(light: true),
          textAlign: TextAlign.center,
        ),
        AppDimension.spacing_5,
        ElevatedButton(
          onPressed: fun,
          child: const Text('Tentar Novamente'),
        ),
      ],
    );
  }
}
