import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/core/exceptions/app_exception.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';

import '/src/core/infra/bloc.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
    required GeolocationRepository geolocationRepository,
  })  : _weatherRepository = weatherRepository,
        _geolocationRepository = geolocationRepository,
        super(HomeInitial());

  final WeatherRepository _weatherRepository;
  final GeolocationRepository _geolocationRepository;

  double lat = 0.0;
  double long = 0.0;

  Future<void> getPosition() async {
    try {
      Position position = await _geolocationRepository.currentPosition();
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      throw AppException(message: 'Permissão obrigatória!');
    }
  }

  Future<void> getWeather() async {
    emit(HomeLoading());
    try {
      await getPosition();
      final weather = await _weatherRepository.getWeather(lat, long);
      emit(HomeSuccess(weather: weather));
    } on AppException catch (e) {
      emit(HomeError(message: e.message));
    }
  }
}
