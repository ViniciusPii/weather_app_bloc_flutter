import 'package:get_it/get_it.dart';
import 'package:weather_app_bloc_flutter/src/core/external/http_service.dart';
import 'package:weather_app_bloc_flutter/src/external/dio_http_service_impl.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/controller/home_bloc.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository_impl.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository_impl.dart';

GetIt get di => GetIt.instance;

class Injection {
  Injection._();

  static configure() {
    _configureServices();
    _configureRepositories();
    _configureControllers();
  }

  static void _configureServices() {
    di.registerLazySingleton<HttpService>(() => DioHttpServiceImpl());
  }

  static void _configureRepositories() {
    di.registerLazySingleton<GeolocationRepository>(() => GeolocationRepositoryImpl());
    di.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(http: di.get()));
  }

  static void _configureControllers() {
    di.registerFactory(
      () => HomeBloc(
        weatherRepository: di.get(),
        geolocationRepository: di.get(),
      ),
    );
  }
}
