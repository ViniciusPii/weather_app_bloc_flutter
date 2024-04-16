import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/spacing_page.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
    required this.title,
    required this.info,
    required this.fun,
  });

  final String info;
  final String title;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpacingPage(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: AppDimension.mega,
              color: AppStyles.primary,
            ),
            const SizedBox(
              height: AppDimension.large,
            ),
            Text(
              title,
              style: AppFonts.titleLarge(),
            ),
            const SizedBox(
              height: AppDimension.small,
            ),
            Text(
              info,
              style: AppFonts.bodyLarge(light: true),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppDimension.mega,
            ),
            ElevatedButton(
              onPressed: fun,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
