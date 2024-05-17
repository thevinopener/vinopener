import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/utils/date_time_util.dart';
import 'package:frontend/widgets/common/molecules/wine_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _isExpanded = false;
  static const int _initialItemCount = 3;

  void _shareAsImage() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderRepaintBoundary boundary = _repaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
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
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // 프로필, 닉네임, 날짜
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          '${widget.feed.user?.imageUrl}',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${widget.feed.user?.nickname}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.mediumSmall,
                        ),
                      ),
                    ],
                  ),
                  Text(formatDateTime(widget.feed.createdTime!)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Image(image: CachedNetworkImageProvider(
                '${widget.feed.imageUrl}'),
                fit: BoxFit.scaleDown,
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
                      icon: Icon(
                        widget.feed.isLiked!
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 30,
                      ),
                    ),
                    Text(
                      '${widget.feed.likeCount}',
                      style: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
              children: [
                // wineList의 첫 번째 부분
                ...widget.feed.wineList!
                    .take(_isExpanded
                        ? widget.feed.wineList!.length
                        : _initialItemCount)
                    .map((wine) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SearchDetailScreen(wineId: wine.id!)),
                            ).then((_) => Provider.of<FeedTabState>(context,
                                    listen: false)
                                .setFeedList());
                          },
                          child: WineItem(wine: wine),
                        )),
                // 더보기 버튼
                if (widget.feed.wineList!.length > _initialItemCount)
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more),
                    label: Text(
                      _isExpanded ? '접기' : '더 보기',
                      style: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                      ),
                    ),
                  ),
              ],
            ),
            // 피드 본문 부분
            isContent(widget.feed.user!.nickname!, widget.feed.content!),
          ],
        ),
      ),
    );
  }
}

Widget isContent(String nickname, String content) {
  if (content != "") {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 30),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${nickname} ',
                    style: GoogleFonts.gowunDodum(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.mediumSmall,
                        color: Colors.black, // RichText의 기본 스타일과 일치시키기 위해 색상 설정
                      ),
                    ),
                  ),
                  TextSpan(
                    text: '${content}',
                    style: GoogleFonts.gowunDodum(
                      textStyle: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                        color: Colors.black, // RichText의 기본 스타일과 일치시키기 위해 색상 설정
                      ),
                    ),
                  ),
                ],
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        // SizedBox(height: 50,)
      ],
    );
  } else {
    return Container(
      child: SizedBox(
        height: 50,
      ),
    );
  }
}
