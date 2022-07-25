import 'package:flutter/material.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/bloc.dart';

class BlocConsumer<B extends Bloc, S extends Object> extends StatelessWidget {
  const BlocConsumer({
    Key? key,
    required this.bloc,
    required this.builder,
    required this.listener,
  }) : super(key: key);

  final B bloc;
  final void Function(BuildContext context, S state) listener;
  final Widget Function(BuildContext context, S state) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      stream: bloc.stream as Stream<S>,
      initialData: bloc.initialValue as S,
      builder: (context, snapshot) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => listener.call(context, snapshot.data!),
        );

        return builder(context, snapshot.data!);
      },
    );
  }
}
