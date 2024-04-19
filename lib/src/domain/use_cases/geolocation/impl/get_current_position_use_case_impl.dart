import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/geolocation/geolocation_repository.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/errors/geolocation_exceptions.dart';
import 'package:weather_app_bloc_flutter/src/domain/use_cases/geolocation/get_current_position_use_case.dart';

class GetCurrentPositionUseCaseImpl implements GetCurrentPositionUseCase {
  GetCurrentPositionUseCaseImpl({
    required GeolocationRepository repository,
  }) : _repository = repository;

  final GeolocationRepository _repository;

  @override
  Future<Position> call() async {
    try {
      LocationPermission permission;

      bool active = await _repository.isActive();

      if (!active) {
        throw GeolocationException(
          title: 'Ative a sua localização!',
          message:
              'Nosso app precisa da sua localização! Isso nos permitirá mostrar as condições climáticas mais precisas no seu local!',
        );
      }

      permission = await _repository.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await _repository.requestPermission();
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

      return await _repository.getCurrentPosition();
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
