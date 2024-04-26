import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  late Dio dio;

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal() {
    dio = Dio();
    _configureDio();
  }

  Dio get instance => dio;

  void _configureDio() {
    dio.options.baseUrl = 'https://api.thevinopener.com';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
  }
}
