
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/feed/feed_content_screen.dart';

class FeedImageScreen extends StatelessWidget {
  const FeedImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedContentScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Image'),
        actions: [
          TextButton(
            onPressed: navigateNext,
            child: Text('다음'),
          ),
        ],
      ),
      body: Center(child: Text('feed image')),
    );
  }
}