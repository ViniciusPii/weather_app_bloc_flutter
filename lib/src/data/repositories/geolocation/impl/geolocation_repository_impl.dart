import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  GeolocationRepositoryImpl();

  @override
  Future<LocationPermission> checkPermission() async => await Geolocator.checkPermission();

  @override
  Future<Position> getCurrentPosition() async => await Geolocator.getCurrentPosition();

  @override
  Future<bool> isActive() async => await Geolocator.isLocationServiceEnabled();

  @override
  Future<LocationPermission> requestPermission() async => await Geolocator.requestPermission();
}
