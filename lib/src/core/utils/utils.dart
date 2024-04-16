import 'package:flutter/material.dart';

extension UtilsExtension on BuildContext {
  T getArgs<T>() {
    if (T == dynamic) {
      throw ArgumentError('Tipagem obrigatória, getArgs<Type>()');
    }

    return ModalRoute.of(this)!.settings.arguments as T;
  }
}
