import 'package:get_it/get_it.dart';
import 'package:weather_app_bloc_flutter/src/core/external/http_service.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/geolocation/geolocation_data_source.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/geolocation/impl/geolocation_data_source_impl.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/impl/geolocation_repository_impl.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/get_current_position_use_case.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/impl/get_current_position_use_case_impl.dart';
import 'package:weather_app_bloc_flutter/src/external/dio_http_service_impl.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/controller/home_bloc.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository_impl.dart';

GetIt get di => GetIt.instance;

class Injection {
  Injection._();

  static configure() {
    _configureServices();
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureControllers();
  }

  static void _configureServices() {
    di.registerLazySingleton<HttpService>(() => DioHttpServiceImpl());
  }

  static void _configureDataSources() {
    di.registerLazySingleton<GeolocationDataSource>(() => GeolocationDataSourceImpl());
  }

  static void _configureRepositories() {
    di.registerLazySingleton<GeolocationRepository>(
        () => GeolocationRepositoryImpl(dataSource: di.get()));
    di.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(http: di.get()));
  }

  static void _configureUseCases() {
    di.registerLazySingleton<GetCurrentPositionUseCase>(
        () => GetCurrentPositionUseCaseImpl(repository: di.get()));
  }

  static void _configureControllers() {
    di.registerFactory(
        () => HomeBloc(weatherRepository: di.get(), getCurrentPositionUseCase: di.get()));
  }
}
