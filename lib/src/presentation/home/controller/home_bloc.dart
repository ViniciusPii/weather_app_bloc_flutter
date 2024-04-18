import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/errors/geolocation_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/errors/weather_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
    required GeolocationRepository geolocationRepository,
  })  : _weatherRepository = weatherRepository,
        _geolocationRepository = geolocationRepository,
        super(HomeInitialState());

  final WeatherRepository _weatherRepository;
  final GeolocationRepository _geolocationRepository;

  Future<void> getPositionAndWeather() async {
    emit(HomeLoadingState());
    try {
      final position = await _geolocationRepository.currentPosition();

      final weather = await _weatherRepository.getWeather(
        position.latitude,
        position.longitude,
      );

      emit(HomeSuccessState(weather: weather));
    } on GeolocationException catch (e) {
      emit(HomeErrorState(title: e.title, message: e.message));
    } on WeatherException catch (e) {
      emit(HomeErrorState(title: e.title, message: e.message));
    }
  }
}
