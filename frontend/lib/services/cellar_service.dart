import 'package:frontend/models/cellar/cellar.dart';
import 'package:frontend/utils/api_client.dart';

class CellarService {

  static Future<List<Cellar>> getListCellar() async {
    print('getListCellar');
    final response = await ApiClient().dio.get('/cellars');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Cellar> listCellar = responseData.map((cellarData) => Cellar.fromJson(cellarData)).toList();
      return listCellar;
    }
    throw Error();
  }
}