import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/home_page.dart';

class Routes {
  static const String home = '/';

  final routes = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
  };

  T getParans<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
