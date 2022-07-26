import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/models/home/home_page.dart';

class Routes {
  static const String home = '/';

  late final routes = <String, WidgetBuilder>{
    home: (context) => HomePage(),
  };

  T getParans<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
