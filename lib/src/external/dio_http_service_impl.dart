import 'package:dio/dio.dart';
import 'package:weather_app_bloc_flutter/src/app_env.dart';
import 'package:weather_app_bloc_flutter/src/external/interceptors/logging_interceptor.dart';

import '/src/core/errors/app_exceptions.dart';
import '/src/core/external/app_client_response.dart';
import '/src/core/external/http_service.dart';

class DioHttpServiceImpl implements HttpService {
  DioHttpServiceImpl() {
    _dio = Dio(BaseOptions(baseUrl: AppEnv.baseUrl));
    _dio.interceptors.add(LoggingInterceptor());
  }

  late final Dio _dio;

  @override
  Future<AppClientResponse<T>> get<T>(String path) async {
    try {
      final response = await _dio.get(path);

      final AppClientResponse<T> appCLientResponse = AppClientResponse(
        data: response.data,
        message: response.statusMessage,
        statusCode: response.statusCode,
      );

      return appCLientResponse;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw AppNetworkException();
      }

      throw AppGenericException();
    }
  }
}
