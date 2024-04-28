import 'package:frontend/models/wine_model.dart';
import 'package:frontend/utils/api_client.dart';

class WineService {
  static Future<List<Wine>> getWineList() async {
    final response = await ApiClient().dio.get('/wines');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Wine> wineList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return wineList;
    }
    throw Error();
  }
}