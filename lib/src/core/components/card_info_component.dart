import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';

class CardInfoComponent extends StatelessWidget {
  const CardInfoComponent({
    Key? key,
    required this.info,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String info;
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
                color: AppExtension.primary,
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
