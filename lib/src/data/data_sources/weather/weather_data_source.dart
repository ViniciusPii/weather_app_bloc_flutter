import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(double lat, double long);
}
