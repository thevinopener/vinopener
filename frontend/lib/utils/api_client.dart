import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  late Dio dio;

  static final baseUrl = 'https://api.thevinopener.com';

  static String? _accessToken = null;
  static String? _refreshToken = null;

  static setAccessToken(String newAccessToken) {
    _accessToken = newAccessToken;
  }

  static setRefreshToken(String newRefreshToken) {
    _refreshToken = newRefreshToken;
  }

  Future<Response> _refreshAccessToken() async {
    Dio dio = Dio();
    return dio.post(
      baseUrl + '/auth/refresh',
      options: Options(
        headers: {
          'Authorization': '$_accessToken',
          'refresh-token': '$_refreshToken'
        },
      ),
    );
  }

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal() {
    dio = Dio();
    _configureDio();
  }

  Dio get instance => dio;

  void _configureDio() {
    dio.options.baseUrl = baseUrl;

    dio.interceptors.add(
      InterceptorsWrapper(
        // set access token
        onRequest: (options, handler) {
          options.headers["Authorization"] = "$_accessToken";
          return handler.next(options);
        },
        // success with access token
        onResponse: (response, handler) {
          return handler.next(response);
        },
        // fail with access token
        // refresh access token with refresh token
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            RequestOptions options = error.response!.requestOptions;
            var refreshAccessTokenResponse = await this._refreshAccessToken();
            // continue request with new access token
            if (refreshAccessTokenResponse.statusCode == 200) {
              print('4번');
              setAccessToken(refreshAccessTokenResponse.data['access-token']);
              options.headers["Authorization"] = "$_accessToken";
              dio.fetch(options).then(
                    (r) => handler.resolve(r),
                onError: (e) => handler.reject(e),
              );
            }
            // fail with refresh token
            else {
              print('5번');
              handler.next(error);
            }
          } else {
            print('6번');
            return handler.next(error);
          }
        },
      ),
    );
  }
}
