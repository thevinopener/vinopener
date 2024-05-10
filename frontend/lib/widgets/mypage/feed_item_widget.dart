import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/utils/date_time_util.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';
import 'package:frontend/widgets/common/molecules/wine_item_widget.dart';
import 'package:frontend/widgets/common/templates/wine_detail_template.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FeedItem extends StatefulWidget {
  final Feed feed;

  FeedItem({super.key, required this.feed});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  final GlobalKey _repaintKey = GlobalKey();

  void _shareAsImage() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderRepaintBoundary boundary =
      _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData = await image.toByteData(
          format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 이미지 파일 저장
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File('$dir/feed_item.png');
      await file.writeAsBytes(pngBytes);

      // 공유
      Share.shareXFiles([XFile(file.path, mimeType: 'image/png')],
          text: 'Check out this feed!');
    });
  }

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
    return RepaintBoundary(
      key: _repaintKey,
      child: Padding(
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
            Hero(
              tag: 'feedImage${widget.feed.id}',
              child: Image.network(
                '${widget.feed.imageUrl}',
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
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
                IconButton(
                  icon: Icon(Icons.ios_share),
                  onPressed: _shareAsImage,
                ),
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
      ),
    );
  }
}
