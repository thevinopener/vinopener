import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
  DateTime? lastPressedTime;

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

    void handleBackPress(BuildContext context) {
      final now = DateTime.now();
      if (lastPressedTime == null ||
          now.difference(lastPressedTime!) > Duration(seconds: 2)) {
        lastPressedTime = now;
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),),
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/vinopener_logo.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  Text(
                    '  종료하려면 뒤로 가기를 다시 눌러주세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              duration: Duration(seconds: 3600),
            ),
          );
      } else {
        SystemNavigator.pop();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          handleBackPress(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/vinopener_logo.png',
                height: 45, // 이미지 크기 조절
                width: 45, // 이미지 크기 조절
              ),
              SizedBox(width: 8), // 이미지와 텍스트 사이의 간격
              Text(
                'Feed',
                style: TextStyle(
                  fontSize: AppFontSizes.mediumLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          leadingWidth: double.maxFinite,
          actions: [
            IconButton(
              onPressed: () => addFeed(context),
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 35,
              ),
            )
          ],
          shape: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        body: Container(
          color: Colors.purple.withOpacity(0.05),
          child: Consumer<FeedTabState>(
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
        ),
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
