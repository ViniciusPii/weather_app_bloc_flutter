class AppLogClientResponse<T> {
  AppLogClientResponse({
    this.data,
    this.path,
    this.message,
    this.errorType,
    this.statusCode,
  });

  T? data;
  String? path;
  int? statusCode;
  String? message;
  String? errorType;
}
