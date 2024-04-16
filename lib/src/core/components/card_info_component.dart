import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';

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
        vertical: AppDimension.size_3,
        horizontal: AppDimension.size_3,
      ),
      margin: const EdgeInsets.only(bottom: AppDimension.size_2),
      decoration: BoxDecoration(
        color: AppExtension.primaryLight,
        borderRadius: BorderRadius.circular(AppDimension.size_2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color ?? AppExtension.primary,
              ),
              const SizedBox(
                width: AppDimension.size_1,
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
