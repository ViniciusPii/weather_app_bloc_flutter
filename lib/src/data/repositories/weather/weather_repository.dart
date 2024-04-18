import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(double lat, double long);
}
