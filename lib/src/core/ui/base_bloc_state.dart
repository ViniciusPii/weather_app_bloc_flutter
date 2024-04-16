import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseBlocState<T extends StatefulWidget, C extends Cubit> extends State<T> {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<C>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady(context);
    });
  }

  void onReady(BuildContext context) {}

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
