import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/screens/feed/feed_img_screen.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/widgets/common/templates/feed_item_widget.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final Future<List<Feed>> feedList = FeedService.getFeedList();

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
          title: Text(
            'Feed',
            style: TextStyle(
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: addFeed,
              icon: Icon(Icons.add),
            )
          ],
          shape: Border(bottom: BorderSide(color: Colors.grey))),
      body: FutureBuilder(
        future: feedList,
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return FeedItem(feed: snapshot.data[index]);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
