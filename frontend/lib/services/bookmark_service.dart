import 'package:frontend/models/bookmark/bookmark.dart';
import 'package:frontend/utils/api_client.dart';

class BookmarkService {

  static void createBookmark(int wineId) async {
    await ApiClient().dio.post('/bookmarks', data: {"wineId": wineId});
  }

  static Future<List<Bookmark>> getListBookmark() async {
    final response = await ApiClient().dio.get('/bookmarks');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Bookmark> listBookmark = responseData.map((bookmarkData) => Bookmark.fromJson(bookmarkData)).toList();
      return listBookmark;
    }
    throw Error();
  }

  static void deleteBookmark(int bookmarkId) async{
    await ApiClient().dio.delete('/bookmarks/${bookmarkId}');
  }
}