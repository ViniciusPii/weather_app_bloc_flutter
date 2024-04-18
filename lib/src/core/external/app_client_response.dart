class AppClientResponse<T> {
  AppClientResponse({
    this.data,
    this.message,
    this.statusCode,
  });

  T? data;
  int? statusCode;
  String? message;
}
