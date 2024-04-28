import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  late Dio dio;

  //
  static String _testAccessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6MSwiZW1haWwiOiJzc2FmeS5jMjA3QGdtYWlsLmNvbSIsImF1dGhvcml0eSI6IlJPTEVfVVNFUiIsImlhdCI6MTcxNDExNDAwNCwiZXhwIjoxNzE2NzA2MDA0fQ.6TPdV_E8u9TYTx0DW2FgNLQjsg7MlQE91TqCs86i1U9-R3xP8m_hsssdnkeoUVgt-Gj-jBtWQCNtx2DXyiK-cA";

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

    // Test
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = "Bearer $_testAccessToken";
          return handler.next(options);
        },
      ),
    );
  }
}
