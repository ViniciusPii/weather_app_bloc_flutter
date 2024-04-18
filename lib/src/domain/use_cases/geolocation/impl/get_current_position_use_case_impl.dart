import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/get_current_position_use_case.dart';

class GetCurrentPositionUseCaseImpl implements GetCurrentPositionUseCase {
  GetCurrentPositionUseCaseImpl({
    required GeolocationRepository repository,
  }) : _repository = repository;

  final GeolocationRepository _repository;

  @override
  Future<Position> call() async => _repository.currentPosition();
}
