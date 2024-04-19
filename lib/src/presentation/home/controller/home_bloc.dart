import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/weather/errors/weather_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/errors/geolocation_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/weather/get_weather_by_current_location_use_case.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc({
    required GetWeatherByCurrentLocationUseCase getWeatherByCurrentLocationUseCase,
  })  : _getWeatherByCurrentLocationUseCase = getWeatherByCurrentLocationUseCase,
        super(HomeInitialState());

  final GetWeatherByCurrentLocationUseCase _getWeatherByCurrentLocationUseCase;

  Future<void> getWeatherByCurrentLocation() async {
    emit(HomeLoadingState());
    try {
      final weather = await _getWeatherByCurrentLocationUseCase();

      emit(HomeSuccessState(weather: weather));
    } on GeolocationException catch (e) {
      emit(HomeErrorState(title: e.title, message: e.message));
    } on WeatherException catch (e) {
      emit(HomeErrorState(title: e.title, message: e.message));
    }
  }
}
