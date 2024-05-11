import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/models/survey_model.dart';
import 'package:frontend/models/token.dart';
import 'package:frontend/utils/api_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserService {

  static final baseUrl = 'https://api.thevinopener.com';
  // static final baseUrl = 'http://localhost:8080';
  // static final baseUrl = 'http://10.0.2.2:8080';

  static Future<Token> login(String accessToken) async {
    Dio dio = Dio();
    final response = await dio.post(
      baseUrl + '/auth/login/google',
      queryParameters: {"token": accessToken},
    );
    return Token.fromJson(response.data);
  }

  static void logout() async {
    await ApiClient().dio.delete('/users/logout');
    // await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  static Future<int> getMyId() async {
    var response = await ApiClient().dio.get('/users/me');
    if (response.statusCode == 200 && response.data != null) {
      var userData = response.data;
      return userData['id'];
    }
    throw Error();
  }

  static void postSurvey(Survey survey) async {
    await ApiClient().dio.post('/preference', data: survey.toJson());
  }

  static void updateSurvey(Survey survey) async {
    await ApiClient().dio.put('/preference', data: survey.toJson());
  }

  static void changeCover() async {
    print('changeCover');
  }
}
