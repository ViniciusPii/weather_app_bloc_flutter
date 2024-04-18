import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/geolocation/errors/geolocation_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/get_current_position_use_case.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/errors/weather_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
    required GetCurrentPositionUseCase getCurrentPositionUseCase,
  })  : _weatherRepository = weatherRepository,
        _getCurrentPositionUseCase = getCurrentPositionUseCase,
        super(HomeInitialState());

  final WeatherRepository _weatherRepository;
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;

  Future<void> getPositionAndWeather() async {
    emit(HomeLoadingState());
    try {
      final position = await _getCurrentPositionUseCase();

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
