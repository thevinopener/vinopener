import 'package:flutter/foundation.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/services/feed_service.dart';

class FeedTabState with ChangeNotifier {

  List<Feed> _feedList;

  FeedTabState(this._feedList);

  List<Feed> get feedList => _feedList;

  void setFeedList() async {
    _feedList = await FeedService.getFeedList();
    _feedList = _feedList.reversed.toList();
    notifyListeners();
  }
}