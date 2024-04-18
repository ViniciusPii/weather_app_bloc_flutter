import 'package:weather_app_bloc_flutter/src/data/extensions/weather/forecast_extension.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/forecast_entity.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';

extension WeatherExtension on WeatherEntity {
  static WeatherEntity fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      temp: map['temp']?.toInt() ?? 0,
      cid: map['cid'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      city: map['city'] ?? '',
      humidity: map['humidity']?.toInt() ?? 0,
      imgId: map['imgId'] ?? '',
      sunset: map['sunset'] ?? '',
      sunrise: map['sunrise'] ?? '',
      cityName: map['cityName'] ?? '',
      currently: map['currently'] ?? '',
      windSpeedy: map['wind_speedy'] ?? '',
      description: map['description'] ?? '',
      conditionSlug: map['condition_slug'] ?? '',
      contitionCode: map['contitionCode'] ?? '',
      forecast: List<ForecastEntity>.from(
        map['forecast']?.map(
          (x) => ForecastExtension.fromMap(x),
        ),
      ),
    );
  }
}
