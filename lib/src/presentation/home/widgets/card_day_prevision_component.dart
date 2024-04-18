import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/forecast_entity.dart';

class CardDayPrevisionComponent extends StatelessWidget {
  const CardDayPrevisionComponent({
    super.key,
    required this.icon,
    required this.forecast,
  });

  final String icon;
  final ForecastEntity forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.large,
        horizontal: AppDimension.extraLarge,
      ),
      decoration: BoxDecoration(
        color: AppStyles.primaryLight,
        borderRadius: BorderRadius.circular(
          AppDimension.large,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _changeTitle(),
            style: AppFonts.labelLarge(),
          ),
          const SizedBox(
            height: AppDimension.large,
          ),
          Row(
            children: [
              SvgPicture.network(
                icon,
                height: AppDimension.jumbo,
              ),
              const SizedBox(
                width: AppDimension.large,
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
