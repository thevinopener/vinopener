import 'package:frontend/models/wine_model.dart';
import 'package:frontend/utils/api_client.dart';

class WineService {
  static Future<List<Wine>> getWineList() async {
    print('getWineList');
    final response = await ApiClient().dio.get('/wines');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Wine> wineList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return wineList;
    }
    throw Error();
  }

  static Future<List<Wine>> searchWineList(String keyword) async {
    final response = await ApiClient().dio.get('/wines/search?query=${keyword}');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Wine> wineList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return wineList;
    }
    throw Error();
  }

  static Future<List<Wine>> pageSearchWineList(String keyword, int page) async {
    final response = await ApiClient().dio.get('/wines/page/search', queryParameters: {
      'query': keyword,
      'page': page,
      'size': 10,
      'sort': "id"
    });
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data['content'];
      List<Wine> wineList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return wineList;
    }
    throw Error();
  }

  static void addWineToBookmark() {
    print('addWineToBookmark');
  }

  static void deleteWineFromBookmark() {
    print('deleteWineFromBookmark');
  }
}