part of 'home_bloc.dart';

sealed class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({
    required this.weather,
  });

  final WeatherModel weather;
}

class HomeErrorState extends HomeState {
  HomeErrorState({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
}
