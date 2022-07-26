import 'package:weather_app_bloc_flutter/src/core/infra/di/dependon.dart';
import 'package:weather_app_bloc_flutter/src/models/home/controller/home_bloc.dart';

Dependon get di => Dependon.instance;

injection() {
  //repositories

  //controllers
  di.registerFactory(() => HomeBloc());
}
