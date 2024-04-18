import 'dart:convert';
import 'dart:developer' as developer;

import '/src/core/external/app_log_client_response.dart';

class AppLog {
  AppLog._();

  static void showLog(AppLogClientResponse response) {
    final logMessage = StringBuffer();

    logMessage.write(separatorLine());

    logMessage.write('Path: ${response.path}\n');
    logMessage.write(separatorLine());

    if (response.data != null && response.data.isNotEmpty) {
      logMessage.write('Data:\n${_prettyPrintJson(response.data)}\n');
      logMessage.write(separatorLine());
    }

    if (response.errorType != null) {
      logMessage.write('Error Type: ${response.errorType}\n');
      logMessage.write(separatorLine());
    }

    logMessage.write('Message: ${response.message}\n');
    logMessage.write(separatorLine());

    if (response.statusCode != null) {
      logMessage.write('Status code: ${response.statusCode}\n');
      logMessage.write(separatorLine());
    }

    developer.log(
      logMessage.toString(),
      name: 'AppLog',
    );
  }

  static String separatorLine() {
    return '${'-' * 50}\n';
  }

  static String _prettyPrintJson(dynamic json) {
    try {
      return const JsonEncoder.withIndent('  ').convert(json);
    } catch (e) {
      return json.toString();
    }
  }
}
