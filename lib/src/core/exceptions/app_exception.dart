enum AppCodeErrors {
  weather,
  geolocation,
}

class AppException {
  AppException({
    required this.error,
    required this.message,
  });

  final String message;
  final AppCodeErrors error;
}
