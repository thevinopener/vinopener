import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/bookmark/bookmark.dart';
import 'package:frontend/models/cellar/cellar.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/feed/feed_detail_screen.dart';
import 'package:frontend/screens/mypage/mypage_setting_screen.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/services/bookmark_service.dart';
import 'package:frontend/services/cellar_service.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/widgets/mypage/bookmark_wine_item.dart';
import 'package:frontend/widgets/mypage/cellar_wine_item.dart';
import 'package:provider/provider.dart';

class CustomCupertinoPageRoute extends CupertinoPageRoute {
  CustomCupertinoPageRoute(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 750); // 전환 시간을 1초로 설정
}

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

    myFeedList = FeedService.getMyFeedList();
    listBookmark = BookmarkService.getListBookmark();
    listCellar = CellarService.getListCellar();
  }

  void _handleTabSelection() {
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
    final user = Provider.of<UserProvider>(context).user;

    myFeedList = FeedService.getMyFeedList();

    double avatarRadius = 50;

    return Scaffold(
      body: Container(
        color: Colors.purple.withOpacity(0.05),
        child:Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.625,
                  child: Container(
                    color: AppColors.white,
                    padding: EdgeInsets.fromLTRB(70, 50, 70, 0),
                  child: Image.asset(
                    'assets/images/vinopener_logo.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width/1.5,
                    fit: BoxFit.fitWidth,
                  ),),
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
                                CustomCupertinoPageRoute(
                                  builder: (context) =>
                                      FeedDetailScreen(snapshot.data[index]),
                                  settings: RouteSettings(),
                                ),
                              ).then((_) {
                                setState(() {
                                  myFeedList = FeedService.getMyFeedList();
                                });
                              });
                            },
                            child: Hero(
                              tag: 'feedImage${snapshot.data[index].id}',
                              child: Image.network(
                                snapshot.data[index].imageUrl,
                                width: 135,
                                height: 135,
                                fit: BoxFit.cover,
                              ),
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
                                  builder: (context) => SearchDetailScreen(
                                      wineId: snapshot.data[index].wine.id),
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
                                  builder: (context) => SearchDetailScreen(
                                      wineId: snapshot.data[index].wine.id),
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
    ),);
  }
}
