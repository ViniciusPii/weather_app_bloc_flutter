import 'dart:async';

abstract class Bloc<T extends Object> {
  Bloc(this.initialValue);

  final T initialValue;

  late T state = initialValue;

  final _controller = StreamController<T>.broadcast();

  Stream<T> get stream => _controller.stream;

  void emit(T state) {
    this.state = state;
    _controller.add(state);
  }

  void dispose() {
    _controller.close();
  }
}
