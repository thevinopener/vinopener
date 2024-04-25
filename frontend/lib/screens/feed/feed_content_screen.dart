import 'package:flutter/material.dart';
import 'package:frontend/screens/feed/feed_screen.dart';

class FeedContentScreen extends StatelessWidget {
  const FeedContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void postFeed() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Content'),
        actions: [
          TextButton(
            onPressed: postFeed,
            child: Text('완료'),
          ),
        ],
      ),
      body: Center(child: Text('feed content')),
    );
  }
}
