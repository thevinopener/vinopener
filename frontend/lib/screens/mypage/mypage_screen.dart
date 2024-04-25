import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
      ),
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
          Text('Nickname'),
          // 탭 바 추가
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Feed'),
              Tab(text: 'Bookmark'),
              Tab(text: 'Cellar'),
            ],
          ),
          // 탭 뷰 추가
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Feed')),
                Center(child: Text('Bookmark')),
                Center(child: Text('Cellar')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
