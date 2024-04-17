import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/app_label.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/app_title.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/spacing_page.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
    required this.action,
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
  final Function() action;

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
            AppTitle(
              title: title ?? 'Ops! Algo deu errado',
            ),
            const SizedBox(
              height: AppDimension.large,
            ),
            AppLabel(
              label: message ??
                  'Não se preocupe, problemas acontecem! Tente novamente, se o erro persistir, tente novamente mais tarde!',
            ),
            const SizedBox(
              height: AppDimension.jumbo,
            ),
            ElevatedButton(
              onPressed: action,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
