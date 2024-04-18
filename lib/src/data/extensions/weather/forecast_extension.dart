import 'package:weather_app_bloc_flutter/src/domain/entities/forecast_entity.dart';

extension ForecastExtension on ForecastEntity {
  static ForecastEntity fromMap(Map<String, dynamic> map) {
    return ForecastEntity(
      max: map['max']?.toInt() ?? 0,
      min: map['min']?.toInt() ?? 0,
      date: map['date'] ?? '',
      weekday: map['weekday'] ?? '',
      condition: map['condition'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
