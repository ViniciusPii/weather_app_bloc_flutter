enum AppCodeErrors implements Exception {
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

class AppGenericException implements Exception {
  AppGenericException({
    required this.message,
  });

  final String message;
}
