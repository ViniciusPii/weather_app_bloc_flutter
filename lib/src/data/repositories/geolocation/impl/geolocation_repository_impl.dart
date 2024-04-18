import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/data/data_sources/geolocation/geolocation_data_source.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  GeolocationRepositoryImpl({
    required GeolocationDataSource dataSource,
  }) : _dataSource = dataSource;

  final GeolocationDataSource _dataSource;

  @override
  Future<Position> currentPosition() async => _dataSource.currentPosition();
}
