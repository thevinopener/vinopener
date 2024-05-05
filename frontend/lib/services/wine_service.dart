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
    print('getWineList');
    throw Error();
  }

  static Future<List<Wine>> searchWineList(String keyword) async {
    final response = await ApiClient().dio.get('/wines');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
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

  // Cellar

  static Future<List<Wine>> getCellarList() async {
    final response = await ApiClient().dio.get('/wines');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Wine> cellarList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return cellarList;
    }
    print('getCellarList');
    throw Error();
  }

  static void addWineToCellar() {
    print('addWineToCellar');
  }

  static void deleteWineFromCellar() {
    print('deleteWineFromCellar');
  }
}