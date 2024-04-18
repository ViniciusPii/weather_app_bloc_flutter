class AppGenericException implements Exception {}

class AppGenericMessageException implements Exception {
  AppGenericMessageException({
    required this.message,
  });

  final String message;
}

class AppNetworkException implements Exception {}

class AppNetworkMessageException implements Exception {
  AppNetworkMessageException({
    required this.message,
  });

  final String message;
}
