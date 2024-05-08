import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/bookmark/bookmark.dart';
import 'package:frontend/models/cellar/cellar.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/feed/feed_detail_screen.dart';
import 'package:frontend/screens/mypage/mypage_setting_screen.dart';
import 'package:frontend/services/bookmark_service.dart';
import 'package:frontend/services/cellar_service.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/common/molecules/wine_item_widget.dart';
import 'package:frontend/widgets/common/templates/wine_detail_template.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';
import 'package:frontend/widgets/mypage/bookmark_wine_item.dart';
import 'package:frontend/widgets/mypage/cellar_wine_item.dart';
import 'package:provider/provider.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late Future<List<Feed>> myFeedList;
  late Future<List<Bookmark>> listBookmark;
  late Future<List<Cellar>> listCellar;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this); // 3개의 탭
    _tabController.addListener(_handleTabSelection);

    myFeedList = FeedService.getDummyList();
    listBookmark = BookmarkService.getListBookmark();
    listCellar = CellarService.getListCellar();
  }

  void _handleTabSelection() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (_tabController.indexIsChanging) {
      setState(() {
        switch (_tabController.index) {
          case 0: // Feed 탭
            myFeedList = FeedService.getMyFeedList();
            break;
          case 1: // Bookmark 탭
            listBookmark = BookmarkService.getListBookmark();
            break;
          case 2: // Cellar 탭
            listCellar = CellarService.getListCellar();
            break;
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = Provider.of<UserProvider>(context).user;

    myFeedList = FeedService.getMyFeedList();

    double avatarRadius = 50;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.625,
                  child: Image.network(
                    'https://picsum.photos/200/300',
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Image.asset(
                        '${user.imageUrl}',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => MyPageSettingScreen(),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: -avatarRadius,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${user.imageUrl}'),
                  radius: avatarRadius,
                ),
              ),
            ],
          ),
          SizedBox(
            width: avatarRadius,
            height: avatarRadius,
          ),
          Text(
            '${user.nickname}',
            style: TextStyle(
              fontSize: AppFontSizes.mediumSmall,
              fontWeight: FontWeight.bold,
            ),
          ),
          // 탭 바 추가
          TabBar(
            tabs: const [
              Tab(text: 'Feed'),
              Tab(text: 'Bookmark'),
              Tab(text: 'Cellar'),
            ],
            controller: _tabController,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
          ),
          // 탭 뷰 추가
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FutureBuilder(
                  future: myFeedList,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      FeedDetailScreen(snapshot.data[index]),
                                ),
                              ).then((_) {
                                setState(() {
                                  myFeedList = FeedService.getMyFeedList();
                                });
                              });
                            },
                            child: Image.network(
                              snapshot.data[index].imageUrl,
                              width: 135,
                              height: 135,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                FutureBuilder(
                  future: listBookmark,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => WineDetailScreen(
                                      wine: snapshot.data[index].wine),
                                ),
                              ).then((_) {
                                setState(() {
                                  listBookmark =
                                      BookmarkService.getListBookmark();
                                });
                              });
                            },
                            child: BookmarkWineItem(
                              bookmark: snapshot.data![index],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                FutureBuilder(
                  future: listCellar,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => WineDetailScreen(
                                      wine: snapshot.data[index].wine),
                                ),
                              ).then((_) {
                                setState(() {
                                  listCellar = CellarService.getListCellar();
                                });
                              });
                            },
                            child: CellarWineItem(
                              cellar: snapshot.data![index],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
