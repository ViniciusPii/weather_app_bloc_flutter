import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}
