import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/bloc.dart';

class BlocBuilder<B extends Bloc, S extends Object> extends StatelessWidget {
  const BlocBuilder({
    super.key,
    required this.bloc,
    required this.builder,
  });

  final B bloc;
  final Widget Function(BuildContext contex, S state) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      stream: bloc.stream as Stream<S>,
      initialData: bloc.initialValue as S,
      builder: (context, snapshot) {
        return builder(context, snapshot.data!);
      },
    );
  }
}
