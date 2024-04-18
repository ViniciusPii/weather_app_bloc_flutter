import 'package:weather_app_bloc_flutter/src/app_env.dart';
import 'package:weather_app_bloc_flutter/src/core/errors/app_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/core/external/http_service.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/errors/weather_exceptions.dart';

import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required HttpService http,
  }) : _http = http;

  final HttpService _http;

  @override
  Future<WeatherModel> getWeather(double lat, double long) async {
    try {
      final response = await _http.get(AppEnv.urlLocation(lat, long));

      final weather = WeatherModel.fromMap(response.data['results']);

      return weather;
    } on AppNetworkException catch (_) {
      throw WeatherException(
        title: 'Sem conexão!',
        message:
            'Parece que você não está conectado em uma rede! Verifique a sua conexão e tente novamente!',
      );
    } catch (e) {
      throw WeatherException(
        title: 'Indisponibilidade no sitema!',
        message:
            'Algo deu errado ao buscar os dados da previsão do tempo, mas não se preocupe! Logo estabilizaremos nossos sistemas!',
      );
    }
  }
}
