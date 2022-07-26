import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/repositories/weather/weather_repository.dart';

import '/src/core/infra/bloc.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  HomeBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(HomeInitial());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(String city) async {
    emit(HomeLoading());
    final weather = await _weatherRepository.getWeather(city);
    emit(HomeSuccess(weather: weather));
  }
}
