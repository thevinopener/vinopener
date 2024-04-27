import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/wine_card_widget.dart';
import 'package:frontend/widgets/wine_item_widget.dart';

import '../../constants/colors.dart';
import '../../models/feed_model.dart';

class MyPageScreen extends StatefulWidget {
  static List<Feed> dummyFeedList = [];
  static Future<List<Wine>> wineList = WineService.getWineList();

  const MyPageScreen({super.key});

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 11; i++) {
      MyPageScreen.dummyFeedList.add(Feed.dummy());
    }
    _tabController = TabController(length: 3, vsync: this); // 3개의 탭
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 50;
    final String defaultImageUrl = 'assets/wine.jpg';

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
                    'https://picsum.photos/400/400',
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Image.asset(
                        defaultImageUrl,
                        fit: BoxFit.scaleDown,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: -avatarRadius,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://avatar.iran.liara.run/public'),
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
            'Nickname',
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
                GridView.builder(
                  itemCount: MyPageScreen.dummyFeedList.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      MyPageScreen.dummyFeedList[index].imageUrl,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
                FutureBuilder(
                  future: MyPageScreen.wineList,
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
                          return WineItem(
                            wine: snapshot.data![index],
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Text('Cellar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}