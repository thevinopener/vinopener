import 'package:frontend/models/survey_model.dart';
import 'package:frontend/models/token.dart';
import 'package:frontend/utils/api_client.dart';

class UserService {
  static Future<Token> login(String accessToken) async {
    final response = await ApiClient().dio.post(
      '/auth/login/google',
      queryParameters: {"token": accessToken},
    );
    return Token.fromJson(response.data);
  }

  static void logout() async {
    await ApiClient().dio.delete('/users/logout');
  }

  static void changeCover() async {
    print('changeCover');
  }

  static void postSurvey() async {
    print('postSurvey');
  }

  static void updateSurvey(Survey survey) async {
    await ApiClient().dio.put('/preference', data: survey.toJson());
  }
}
