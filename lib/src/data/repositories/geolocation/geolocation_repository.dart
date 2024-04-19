import 'package:geolocator/geolocator.dart';

abstract class GeolocationRepository {
  Future<bool> isActive();
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<Position> getCurrentPosition();
}
