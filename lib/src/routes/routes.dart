import 'package:flutter/material.dart';

class Routes {
  late final routes = <String, WidgetBuilder>{};

  T getParans<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
