class AppClientResponse<T> {
  AppClientResponse({
    this.data,
    this.message,
    this.errorType,
    this.statusCode,
  });

  T? data;
  int? statusCode;
  String? message;
  String? errorType;
}
