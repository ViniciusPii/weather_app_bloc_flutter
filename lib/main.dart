import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/app.dart';
import 'package:weather_app_bloc_flutter/src/di/injection.dart';

void main() {
  Injection.configure();
  runApp(const App());
}
