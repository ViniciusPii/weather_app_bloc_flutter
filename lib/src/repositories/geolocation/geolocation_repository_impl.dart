import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/core/exceptions/app_exception.dart';

import 'geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  @override
  Future<Position> currentPosition() async {
    LocationPermission permission;

    bool active = await Geolocator.isLocationServiceEnabled();

    if (!active) {
      throw AppException(
        message: 'Você precisa aceitar a permissão para utilizar o app!',
      );
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw AppException(
          message: 'Você precisa aceitar a permissão para utilizar o app!',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw AppException(
        message: 'Você precisa aceitar a permissão para utilizar o app!',
      );
    }

    return await Geolocator.getCurrentPosition();
  }
}
