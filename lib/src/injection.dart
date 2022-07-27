import 'package:dio/dio.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/di/dependon.dart';
import 'package:weather_app_bloc_flutter/src/modules/home/controller/home_bloc.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository_impl.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository_impl.dart';

Dependon get di => Dependon.instance;

injection() {
  //services
  di.registerLazySingleton(() => Dio());

  //repositories
  di.registerLazySingleton<GeolocationRepository>(() => GeolocationRepositoryImpl());
  di.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(dio: get()));

  //controllers
  di.registerFactory(
    () => HomeBloc(
      weatherRepository: get(),
      geolocationRepository: get(),
    ),
  );
}
