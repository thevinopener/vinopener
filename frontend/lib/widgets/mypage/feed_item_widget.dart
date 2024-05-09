import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/utils/date_time_util.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';
import 'package:frontend/widgets/common/molecules/wine_item_widget.dart';
import 'package:frontend/widgets/common/templates/wine_detail_template.dart';
import 'package:provider/provider.dart';

class FeedItem extends StatefulWidget {
  final Feed feed;

  FeedItem({super.key, required this.feed});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {

  void _toggleLike() {
    setState(() {
      if (widget.feed.isLiked!) {
        widget.feed.likeCount = widget.feed.likeCount! - 1;
        FeedService.switchLike(widget.feed.id);
      } else {
        widget.feed.likeCount = widget.feed.likeCount! + 1;
        FeedService.switchLike(widget.feed.id);
      }
      widget.feed.isLiked = !widget.feed.isLiked!;
    });
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
                  SizedBox(width: 10),
                  Text('${widget.feed.user?.nickname}'),
                ],
              ),
              Text(formatDateTime(widget.feed.createdTime!)),
            ],
          ),
          SizedBox(height: 5),
          Image.network(
            '${widget.feed.imageUrl}',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _toggleLike,
                    icon:
                        Icon(widget.feed.isLiked! ? Icons.favorite : Icons.favorite_outline),
                  ),
                  Text('${widget.feed.likeCount}'),
                ],
              ),
              Spacer(),
              Icon(Icons.ios_share),
            ],
          ),
          Column(
            children: widget.feed.wineList
                    ?.map((wine) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    WineDetailScreen(wine: wine)),
                          ).then((_) =>
                              Provider.of<FeedTabState>(context, listen: false)
                                  .setFeedList());
                        },
                        child: WineItem(wine: wine)))
                    .toList() ??
                [],
          ),
          Text('${widget.feed.content}'),
          SizedBox(height: 5),
          CustomListTile(
            leadingIcon: Icons.visibility_off_outlined,
            title: '공개 여부',
            trailing: Switch(
              value: widget.feed.isPublic!,
              onChanged: (bool value) {
                setState(() {
                  FeedService.switchPublic(widget.feed.id);
                  widget.feed.isPublic = !widget.feed.isPublic!;
                });
              },
              activeColor: AppColors.primary,
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Colors.grey,
              thumbColor: MaterialStateProperty.all(Colors.white),
              trackOutlineColor:
              MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
