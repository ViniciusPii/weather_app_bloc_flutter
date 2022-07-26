import 'package:dio/dio.dart';
import 'package:weather_app_bloc_flutter/src/core/utils/app_env.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';

import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<WeatherModel> getWeather(String city) async {
    final response = await _dio.get(AppEnv.baseUrlByName + city);

    final weather = WeatherModel.fromMap(response.data['results']);

    return weather;
  }
}
