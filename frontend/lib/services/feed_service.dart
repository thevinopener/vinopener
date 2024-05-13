import 'package:dio/dio.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/models/feed/feed_post_requests.dart';
import 'package:frontend/utils/api_client.dart';

class FeedService {

  static void postFeed(FeedPostRequest feedPostRequest) async {

    FormData formData = FormData.fromMap({
      'content': feedPostRequest.content,
      'isPublic': feedPostRequest.isPublic.toString(),
      'wineIds': feedPostRequest.wineIdList,
      'imageFile': feedPostRequest.imageFile,
    });

    var response = await ApiClient().dio.post(
      '/feeds',
      data: formData,
      options: Options(
        headers: {
          'content-type': 'multipart/form-data',
        },
      ),
    );
    print(response);
    print('postFeed');
  }

  static Future<List<Feed>> getFeedList() async {
    var response = await ApiClient().dio.get('/feeds');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Feed> feedList = responseData.map((feedData) => Feed.fromJson(feedData)).toList();
      return feedList;
    }
    throw Error();
  }

  static Future<List<Feed>> getMyFeedList() async {
    print('getMyFeedList');
    var response = await ApiClient().dio.get('/feeds/my');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Feed> myFeedList = responseData.map((feedData) => Feed.fromJson(feedData)).toList();
      return myFeedList;
    }
    throw Error();
  }

  static void deleteFeed(int feedId) async {
    await ApiClient().dio.delete('/feeds/${feedId}');
  }

  static void switchPublic(int feedId) async {
    await ApiClient().dio.post('/feeds/public/${feedId}');
  }

  static void switchLike(int feedId) async {
    await ApiClient().dio.post('/feeds/like/${feedId}');
  }
}