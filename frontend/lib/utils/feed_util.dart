
import 'package:frontend/models/feed.dart';

class FeedUtil {
  static int countPublicFeed(List<Feed> listFeed) {
    int count = 0;
    for (Feed feed in listFeed) {
      if (feed.isPublic == true) count++;
    }
    return count;
  }
}