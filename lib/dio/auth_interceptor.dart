import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({"api_key": "${dotenv.env["API_KEY"]}"});
    super.onRequest(options, handler);
  }
}

class ApiKeyException implements Exception {}
