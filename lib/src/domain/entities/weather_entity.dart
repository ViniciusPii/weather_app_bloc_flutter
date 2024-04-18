import 'package:weather_app_bloc_flutter/src/domain/entities/forecast_entity.dart';

class WeatherEntity {
  WeatherEntity({
    required this.temp,
    required this.cid,
    required this.date,
    required this.time,
    required this.city,
    required this.humidity,
    required this.imgId,
    required this.sunset,
    required this.sunrise,
    required this.cityName,
    required this.forecast,
    required this.currently,
    required this.windSpeedy,
    required this.description,
    required this.conditionSlug,
    required this.contitionCode,
  });

  final int temp;
  final String cid;
  final String date;
  final String time;
  final String city;
  final int humidity;
  final String imgId;
  final String sunset;
  final String sunrise;
  final String cityName;
  final String currently;
  final String windSpeedy;
  final String description;
  final String conditionSlug;
  final String contitionCode;
  final List<ForecastEntity> forecast;
}
