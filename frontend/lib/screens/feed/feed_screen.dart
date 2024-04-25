import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/feed/feed_img_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void addFeed() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedImageScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: addFeed,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(child: Text('feed')),
    );
  }
}
