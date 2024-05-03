import 'package:flutter/material.dart';
import 'package:frontend/models/feed.dart';

class FeedItem extends StatefulWidget {
  final Feed feed;

  FeedItem({super.key, required this.feed});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool isLiked = false;
  late int likeCount;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount -= 1;
      } else {
        likeCount += 1;
      }
      isLiked = !isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    likeCount = widget.feed.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('${widget.feed.user.imageUrl}'),
                  ),
                  SizedBox(width: 20),
                  Text('전원빈'),
                ],
              ),
              Text('${widget.feed.createdTime}'),
            ],
          ),
          SizedBox(height: 20),
          Image.asset('${widget.feed.imageUrl}'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _toggleLike,
                    icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
                  ),
                  Text('${likeCount}'),
                ],
              ),
              Spacer(),
              Icon(Icons.ios_share),
            ],
          ),
          Text('${widget.feed.content}'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
