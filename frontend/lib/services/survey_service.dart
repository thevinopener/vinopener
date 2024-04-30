import 'package:frontend/utils/api_client.dart';

import '../models/survey_model.dart';

class SurveyService {


  static Future<dynamic> postSurvey(Survey survey) async {
    final response = await ApiClient().dio.post('/preference',data: survey);
    if (response.statusCode == 200) {
      return response.statusCode;
    }
    throw Error();
  }
}