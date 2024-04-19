import 'package:weather_app_bloc_flutter/src/domain/entities/forecast_entity.dart';

class WeatherEntity {
  WeatherEntity({
    required this.temp,
    required this.time,
    required this.city,
    required this.humidity,
    required this.forecast,
    required this.windSpeedy,
    required this.description,
    required this.conditionSlug,
  });

  final int temp;
  final String time;
  final String city;
  final int humidity;
  final String windSpeedy;
  final String description;
  final String conditionSlug;
  final List<ForecastEntity> forecast;
}
