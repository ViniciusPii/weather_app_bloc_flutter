import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/get_current_position_use_case.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/weather/get_weather_by_current_location_use_case.dart';

class GetWeatherByCurrentLocationUseCaseImpl implements GetWeatherByCurrentLocationUseCase {
  GetWeatherByCurrentLocationUseCaseImpl({
    required WeatherRepository repository,
    required GetCurrentPositionUseCase getCurrentPositionUseCase,
  })  : _repository = repository,
        _getCurrentPositionUseCase = getCurrentPositionUseCase;

  final WeatherRepository _repository;
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;

  @override
  Future<WeatherEntity> call() async {
    final Position position = await _getCurrentPositionUseCase();

    final WeatherEntity weather =
        await _repository.getWeather(position.latitude, position.longitude);

    return weather;
  }
}
