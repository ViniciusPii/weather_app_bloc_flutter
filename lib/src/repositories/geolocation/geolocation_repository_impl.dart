import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/core/exceptions/app_exception.dart';

import 'geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  @override
  Future<Position> currentPosition() async {
    try {
      LocationPermission permission;

      bool active = await Geolocator.isLocationServiceEnabled();

      if (!active) {
        throw AppException(
          error: AppCodeErrors.geolocation,
          message: 'Ative o serviço de Geolocalização',
        );
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw AppException(
            error: AppCodeErrors.geolocation,
            message: 'Você negou a Permissão!',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw AppException(
          error: AppCodeErrors.geolocation,
          message: 'Não podemos mais pedir permissão!',
        );
      }

      return await Geolocator.getCurrentPosition();
    } on AppException catch (e) {
      throw AppException(
        error: AppCodeErrors.geolocation,
        message: e.message,
      );
    } catch (e) {
      throw AppGenericException(message: 'Erro Genérico');
    }
  }
}
