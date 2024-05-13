import 'package:flutter/material.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/widgets/mypage/feed_item_widget.dart';

class FeedDetailScreen extends StatelessWidget {
  final Feed feed;

  FeedDetailScreen(this.feed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Detail'),
        actions: [
          IconButton(
            color: Colors.red,
            onPressed: () => deleteFeed(context, feed.id),
            icon: Icon(Icons.delete_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FeedItem(
          feed: feed,
        ),
      ),
    );
  }

  void deleteFeed(BuildContext context, int feedId) async {
    FeedService.deleteFeed(feedId);
    Navigator.of(context).pop();
  }
}
