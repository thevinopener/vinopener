import 'package:flutter/foundation.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/services/feed_service.dart';

class FeedTabState with ChangeNotifier {

  List<Feed> _feedList;
  bool _isLoading = false;

  FeedTabState(this._feedList);

  List<Feed> get feedList => _feedList;

  bool get isLoading => _isLoading;

  void setFeedList() async {
    _isLoading = true;
    _feedList = await FeedService.getFeedList();
    _feedList = _feedList.reversed.toList();
    notifyListeners();
    _isLoading = false;
  }
}