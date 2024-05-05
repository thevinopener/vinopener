import 'package:frontend/models/survey_model.dart';
import 'package:frontend/utils/api_client.dart';

class UserService {

  static void changeCover() async {
    print('changeCover');
  }

  static void postSurvey() async {
    print('postSurvey');
  }

  static void updateSurvey(Survey survey) async {
    await ApiClient().dio.put('/preference', data: survey.toJson());
  }

  static void logout() async {
    await ApiClient().dio.delete('/users/logout');
  }
}
