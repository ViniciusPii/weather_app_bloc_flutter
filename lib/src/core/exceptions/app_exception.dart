enum AppCodeErrors implements Exception {
  weather,
  geolocation,
}

class AppException {
  AppException({
    this.title,
    this.message,
    required this.error,
  });

  final String? title;
  final String? message;
  final AppCodeErrors error;
}

class GeolocationException {
  GeolocationException({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
}
