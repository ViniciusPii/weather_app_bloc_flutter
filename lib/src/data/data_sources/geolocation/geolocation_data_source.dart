import 'package:geolocator/geolocator.dart';

abstract class GeolocationDataSource {
  Future<Position> currentPosition();
}
