import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/utils/feed_util.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/widgets/feed/feed_item_widget.dart';
import 'package:frontend/screens/feed/feed_img_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:frontend/constants/fonts.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FeedTabState>(context, listen: false).setFeedList();
  }

  @override
  Widget build(BuildContext context) {
    void addFeed(BuildContext context) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedImageScreen(),
        ),
      ).then((_) {
        setState(() {
          Provider.of<FeedTabState>(context, listen: false).setFeedList();
        });
      });
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
            onPressed: () => addFeed(context),
            icon: Icon(Icons.add),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: Consumer<FeedTabState>(
        builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: _refreshFeedList,
            child: provider.isLoading
                ? FeedItemSkeleton()
                : FeedUtil.countPublicFeed(provider.feedList) == 0
                    ? Center(
                      child: Text(
                          '💬\n작성된 피드가 없어요!\n와인을 마신 경험을 공유해볼까요?\n🍷',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    )
                    : ListView.builder(
                        itemCount: provider.feedList.length,
                        itemBuilder: (context, index) {
                          if (provider.feedList[index].isPublic!) {
                            return FeedItem(feed: provider.feedList[index]);
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
          );
        },
      ),
    );
  }

  Future<void> _refreshFeedList() async {
    Provider.of<FeedTabState>(context, listen: false).setFeedList();
  }
}

Widget FeedItemSkeleton() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 1, // 예를 들어 6개의 스켈레톤 아이템을 생성
      itemBuilder: (context, index) => Container(
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
                      CircleAvatar(),
                      SizedBox(width: 10),
                      Container(width: 40, height: 8, color: Colors.white),
                    ],
                  ),
                  Container(width: 40, height: 8, color: Colors.white),
                ],
              ),
              SizedBox(height: 5),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.white),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  color: Colors.white),
            ],
          ),
        ),
      ),
    ),
  );
}
