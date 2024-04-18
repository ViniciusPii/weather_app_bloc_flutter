import 'package:geolocator/geolocator.dart';

abstract class GetCurrentPositionUseCase {
  Future<Position> call();
}
