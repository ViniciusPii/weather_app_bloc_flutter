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
  HomeSuccess({
    required this.weather,
  }) : super();

  final WeatherModel weather;
}

class HomeError extends HomeState {
  HomeError({
    this.title,
    this.message,
  }) : super();

  final String? title;
  final String? message;
}

class HomeGeolocationError extends HomeState {
  HomeGeolocationError({
    required this.message,
  }) : super();

  final String message;
}
