import 'package:dio/dio.dart';

class HttpServices {
  late final Dio _dio;

  HttpServices() {
    _dio = Dio();
  }

  Future<Response<T>> get<T>(String path) async {
    return await _dio.get(path);
  }
}