import 'package:dio/dio.dart';
import 'package:weather_app_bloc_flutter/src/app_env.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/errors/weather_exceptions.dart';

import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<WeatherModel> getWeather(double lat, double long) async {
    try {
      final response = await _dio.get(AppEnv.urlLocation(lat, long));

      final weather = WeatherModel.fromMap(response.data['results']);

      return weather;
    } catch (e) {
      throw WeatherException(
        title: 'Indisponibilidade no sitema!',
        message:
            'Parece que você não está conectado em uma rede! Verifique a sua conexão e tente novamente!',
      );
    }
  }
}
