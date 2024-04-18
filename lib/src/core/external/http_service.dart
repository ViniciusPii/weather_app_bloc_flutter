import '/src/core/external/app_client_response.dart';

abstract class HttpService {
  Future<AppClientResponse<T>> get<T>(String path);
}
