import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/feed_model.dart';

class Feed extends StatefulWidget {
  final FeedModel feedModel;

  const Feed({super.key, required this.feedModel});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/penguin.jpg'),
            ),
            Text('user.nickname'),
            Text('feed.createdAt'),
          ],
        ),
        Image.asset('assets/images/wine.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_outline),
                Text('feed.likeCount'),
              ],
            ),
            Icon(Icons.ios_share),
          ],
        ),
        Text('wine item'),
        Text('feed.content'),
      ],
    );
  }
}
