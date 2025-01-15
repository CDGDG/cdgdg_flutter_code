import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:dio/dio.dart';

class Client {
  final Dio _dio;
  static final Client _instance = Client._();
  static Dio get instance => _instance._dio;

  Client._()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        error: true,
      ),
      AuthInterceptor(),
    ]);
  }
}
