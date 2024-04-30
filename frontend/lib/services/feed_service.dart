import 'package:frontend/models/feed.dart';

class FeedService {

  static void postFeed(Feed feed) async {
    print('postFeed : ${feed.toString()}');
  }

  static Future<Feed> getFeed() async {
    return Feed.dummy();
  }

  static Future<List<Feed>> getFeedList() async {
    List<Feed> feedList = [];
    for (int i = 0; i < 3; i++) {
      feedList.add(Feed.dummy());
    }
    return feedList;
  }

  static Future<List<Feed>> getMyFeedList() async {
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
}