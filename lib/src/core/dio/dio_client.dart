import 'package:dio/dio.dart';

class DioClient {
  DioClient._(this._dio);
  final Dio _dio;

  factory DioClient.create(String baseUrl, {List<Interceptor>? interceptors}) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
    return DioClient._(dio);
  }

  String get baseUrl => _dio.options.baseUrl;
  Dio get dio => _dio;
}
