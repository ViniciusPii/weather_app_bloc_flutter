import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_fonts.dart';

class CardInfoComponent extends StatelessWidget {
  const CardInfoComponent({
    super.key,
    required this.info,
    required this.title,
    required this.icon,
    this.color,
  });

  final String info;
  final Color? color;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.extraLarge,
        horizontal: AppDimension.extraLarge,
      ),
      margin: const EdgeInsets.only(bottom: AppDimension.large),
      decoration: BoxDecoration(
        color: AppStyles.primaryLight,
        borderRadius: BorderRadius.circular(AppDimension.large),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color ?? AppStyles.primary,
              ),
              const SizedBox(
                width: AppDimension.medium,
              ),
              Text(
                title,
                style: AppFonts.labelLarge(),
              )
            ],
          ),
          Text(
            info,
            style: AppFonts.labelLarge(),
          )
        ],
      ),
    );
  }
}
