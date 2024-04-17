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
        throw GeolocationException(
          title: 'Ative a sua localização!',
          message:
              'Nosso app precisa da sua localização! Isso nos permitirá mostrar as condições climáticas mais precisas no seu local!',
        );
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw GeolocationException(
            title: 'Permissão negada!',
            message:
                'Precisamos da sua permissão para acessar sua localização! Tente novamente. Se não conseguir, habilite nas configurações ou desinstale e instale nosso app novamente!',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw GeolocationException(
          title: 'Permissão negada!',
          message:
              'Precisamos da sua permissão para acessar sua localização! Tente novamente. Se não conseguir, habilite nas configurações ou desinstale e instale nosso app novamente!',
        );
      }

      return await Geolocator.getCurrentPosition();
    } on GeolocationException catch (e) {
      throw GeolocationException(
        title: e.title,
        message: e.message,
      );
    } catch (e) {
      throw GeolocationException();
    }
  }
}
