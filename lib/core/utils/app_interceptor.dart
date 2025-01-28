import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Requesting [${options.method}] ${options.baseUrl}${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[${response.statusCode}] ${response.requestOptions.baseUrl} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Interceptor Error: ${err.message}');
    if (err.response != null) {
      log('Status Code: ${err.response?.statusCode}');
      log('Error Response ${err.response?.data}');
    }
    handler.next(err);
  }
}
