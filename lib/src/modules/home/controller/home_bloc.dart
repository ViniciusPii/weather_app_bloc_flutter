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

  Future<void> getPositionAndWeather() async {
    emit(HomeLoading());
    try {
      await _getWeather();
      await _getPosition();
    } on AppException catch (e) {
      if (e.error == AppCodeErrors.geolocation) {
        emit(HomeGeolocationError(message: e.message));
      } else if (e.error == AppCodeErrors.weather) {
        emit(HomeError(message: e.message));
      }
    }
  }

  Future<void> _getPosition() async {
    Position position = await _geolocationRepository.currentPosition();
    lat = position.latitude;
    long = position.longitude;
  }

  Future<void> _getWeather() async {
    await _getPosition();
    final weather = await _weatherRepository.getWeather(lat, long);
    emit(HomeSuccess(weather: weather));
  }
}
