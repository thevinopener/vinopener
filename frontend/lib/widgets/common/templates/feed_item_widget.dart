import 'package:flutter/material.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/utils/date_time_util.dart';

import '../molecules/wine_item_widget.dart';

class FeedItem extends StatefulWidget {
  final Feed feed;

  FeedItem({super.key, required this.feed});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  late bool isLiked = false;
  late int likeCount;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount -= 1;
        // FeedService.cancelLikeOnFeed();
      } else {
        likeCount += 1;
        // FeedService.likeFeed();
      }
      isLiked = !isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    likeCount = widget.feed.likeCount!;
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
                    backgroundImage:
                        NetworkImage('${widget.feed.user?.imageUrl}'),
                  ),
                  SizedBox(width: 20),
                  Text('${widget.feed.user?.nickname}'),
                ],
              ),
              Text(formatDateTime(widget.feed.createdTime!)),
            ],
          ),
          SizedBox(height: 20),
          Image.network(
            '${widget.feed.imageUrl}',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _toggleLike,
                    icon:
                        Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
                  ),
                  Text('${likeCount}'),
                ],
              ),
              Spacer(),
              Icon(Icons.ios_share),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: widget.feed.wineList
                    ?.map((wine) => GestureDetector(child: WineItem(wine: wine)))
                    .toList() ??
                [],
          ),
          Text('${widget.feed.content}'),
        ],
      ),
    );
  }
}
