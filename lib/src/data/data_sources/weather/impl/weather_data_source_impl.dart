import 'package:weather_app_bloc_flutter/src/app_env.dart';
import 'package:weather_app_bloc_flutter/src/core/errors/app_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/core/external/http_service.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/weather/weather_data_source.dart';
import 'package:weather_app_bloc_flutter/src/data/extensions/weather/weather_extension.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl({
    required HttpService http,
  }) : _http = http;

  final HttpService _http;

  @override
  Future<WeatherEntity> getWeather(double lat, double long) async {
    final String baseUrl = '?key=${AppEnv.userKey}&lat=$lat&lon=$long&user_ip=remote';

    try {
      final response = await _http.get(baseUrl);

      final weather = WeatherExtension.fromMap(response.data['results']);

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
