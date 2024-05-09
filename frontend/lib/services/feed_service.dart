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

  static Future<Feed> getFeed() async {
    return Feed.dummy();
  }

  static Future<List<Feed>> getDummyList() async {
    return [];
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
    // var response = await ApiClient().dio.get('/feeds/my');
    // if (response.statusCode == 200) {
    //   List<dynamic> responseData = response.data;
    //   List<Feed> myFeedList = responseData.map((feedData) => Feed.fromJson(feedData)).toList();
    //   return myFeedList;
    // }
    // throw Error();
    print('getMyFeedList');
    List<Feed> myFeedList = [];
    for (int i = 0; i < 10; i++) {
      myFeedList.add(Feed.dummy());
    }
    return myFeedList;
  }

  static void deleteFeed(Feed feed) async {
    print('deleteFeed');
  }

  static void setFeedPrivate(Feed feed) async {
    print('setFeedPrivate');
  }

  static void setFeedPublic(Feed feed) async {
    print('setFeedPublic');
  }

  static void likeFeed() async {
    print('likeFeed');
  }

  static void cancelLikeOnFeed() async {
    print('cancelLikeOnFeed');
  }

  static void switchLikeOnFeed(int feedId) async {
    await ApiClient().dio.get('/feeds/like/${feedId}');
  }
}