import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log('|| --> Path: ${response.requestOptions.uri}');
    _log('|| --> Status Code: ${response.statusCode}');
    _log('|| --> Response Data: ${_prettyPrintJson(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log('|| --> Path: ${err.requestOptions.uri}');
    _log('|| --> Message: ${err.message}');
    _log('|| --> Error Type: ${err.type.name}');
    super.onError(err, handler);
  }

  void _log(String message) {
    developer.log(
      message,
      name: 'DioLogger',
    );
  }
}

String _prettyPrintJson(dynamic json) {
  try {
    const encoder = JsonEncoder.withIndent('  ');
    final prettyString = encoder.convert(json);
    return prettyString;
  } catch (e) {
    return json.toString();
  }
}
