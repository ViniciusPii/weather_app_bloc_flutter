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

  Future<void> getPositionAndWeather() async {
    emit(HomeLoading());
    try {
      final position = await _geolocationRepository.currentPosition();

      final weather = await _weatherRepository.getWeather(
        position.latitude,
        position.longitude,
      );

      emit(HomeSuccess(weather: weather));
    } on AppException catch (e) {
      emit(HomeError(message: e.message));
    }
  }
}
