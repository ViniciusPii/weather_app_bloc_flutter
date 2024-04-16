import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_bloc_flutter/src/modules/home/controller/home_bloc.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository_impl.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository_impl.dart';

GetIt get di => GetIt.instance;

injection() {
  //services
  di.registerLazySingleton(() => Dio());

  //repositories
  di.registerLazySingleton<GeolocationRepository>(() => GeolocationRepositoryImpl());
  di.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(dio: di.get()));

  //controllers
  di.registerFactory(
    () => HomeBloc(
      weatherRepository: di.get(),
      geolocationRepository: di.get(),
    ),
  );
}
