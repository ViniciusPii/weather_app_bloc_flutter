import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';

abstract class GetWeatherByCurrentLocationUseCase {
  Future<WeatherModel> call();
}
