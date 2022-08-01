import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/models/forecast_model.dart';

class CardDayPrevisionComponent extends StatelessWidget {
  const CardDayPrevisionComponent({
    Key? key,
    required this.icon,
    required this.forecast,
  }) : super(key: key);

  final String icon;
  final ForecastModel forecast;

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
            _changeTitle(),
            style: AppFonts.labelLarge(),
          ),
          AppDimension.spacing_2,
          Row(
            children: [
              SvgPicture.asset(
                icon,
                height: AppDimension.size_6,
                color: AppExtension.primary,
              ),
              const SizedBox(
                width: AppDimension.size_2,
              ),
              Column(
                children: [
                  Text(
                    '${forecast.max}°',
                    style: AppFonts.labelMedium(),
                  ),
                  Text(
                    '${forecast.min}°',
                    style: AppFonts.labelMedium(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _changeTitle() {
    final day = DateFormat('dd/MM').format(DateTime.now());

    if (forecast.date == day) {
      return 'Hoje';
    } else {
      return '${forecast.weekday} - ${forecast.date}';
    }
  }
}
