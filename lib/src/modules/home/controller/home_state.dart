part of 'home_bloc.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {
  HomeInitial() : super();
}

class HomeLoading extends HomeState {
  HomeLoading() : super();
}

class HomeSuccess extends HomeState {
  HomeSuccess() : super();
}

class HomeError extends HomeState {
  HomeError({
    required this.message,
  }) : super();

  final String message;
}
