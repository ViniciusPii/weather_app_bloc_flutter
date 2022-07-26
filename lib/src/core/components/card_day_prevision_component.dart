import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';

class CardDayPrevisionComponent extends StatelessWidget {
  const CardDayPrevisionComponent({
    Key? key,
    required this.max,
    required this.min,
    required this.day,
    required this.icon,
    required this.condition,
  }) : super(key: key);

  final String max;
  final String min;
  final String day;
  final IconData icon;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.size_2,
        horizontal: AppDimension.size_3,
      ),
      decoration: BoxDecoration(
        color: AppExtension.primaryLight,
        borderRadius: BorderRadius.circular(
          AppDimension.size_2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: AppFonts.labelLarge(),
          ),
          AppDimension.spacing_2,
          Row(
            children: [
              Icon(
                icon,
                color: AppExtension.primary,
              ),
              const SizedBox(
                width: AppDimension.size_2,
              ),
              Column(
                children: [
                  Text(
                    max,
                    style: AppFonts.labelMedium(),
                  ),
                  Text(
                    min,
                    style: AppFonts.labelMedium(),
                  ),
                ],
              )
            ],
          ),
          AppDimension.spacing_2,
          Text(
            'Chuva',
            style: AppFonts.labelLarge(),
          )
        ],
      ),
    );
  }
}
