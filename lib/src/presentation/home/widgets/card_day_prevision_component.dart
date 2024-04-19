import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_colors.dart';
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
      padding: const EdgeInsets.all(AppDimension.large),
      decoration: BoxDecoration(
        color: AppStyles.primaryLight,
        borderRadius: BorderRadius.circular(
          AppDimension.large,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _changeTitle(),
            style: AppFonts.labelLarge(),
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
                  Row(
                    children: [
                      Text(
                        '${forecast.max}°',
                        style: AppFonts.labelLarge(),
                      ),
                      const SizedBox(
                        width: AppDimension.small,
                      ),
                      const Icon(
                        FontAwesomeIcons.upLong,
                        size: 12,
                        color: AppColors.red,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${forecast.min}°',
                        style: AppFonts.labelLarge(),
                      ),
                      const SizedBox(
                        width: AppDimension.small,
                      ),
                      const Icon(
                        FontAwesomeIcons.downLong,
                        size: 12,
                        color: AppColors.blue600,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Chuva ${forecast.rainProbability.toString()}%',
            style: AppFonts.labelLarge(),
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
