import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:frontend/providers/bottombar_provider.dart';
import 'package:frontend/screens/feed/feed_screen.dart';
import 'package:frontend/screens/note/note_list_screen.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';
import 'package:frontend/screens/search/search_camera_screen.dart';
import 'package:frontend/screens/recommend/recommend_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPageIndex = 1;  // 초기 페이지 인덱스는 1 (Home Screen)
  late Future<List<CameraDescription>> camerasFuture;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    camerasFuture = availableCameras();  // 카메라 목록을 비동기적으로 로드합니다.
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SafeArea(
              child: FutureBuilder<List<CameraDescription>>(
                future: camerasFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data!.isNotEmpty) {
                    return SearchCameraScreen(camera: snapshot.data!.first);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('카메라 로드 실패: ${snapshot.error}'));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              )
          ), // 0번 페이지
          SafeArea(child: RecommendScreen()), // 1번 페이지
          SafeArea(child: FeedScreen()), // 2번 페이지
          SafeArea(child: NoteListScreen()), // 3번 페이지
          SafeArea(child: MyPageScreen()), // 4번 페이지
        ],
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
            bottomBarProvider.setIndex(index);
          });
        },
      ),
      bottomNavigationBar: _currentPageIndex != 0
          ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomBarProvider.currentIndex,
        onTap: (index) {
          bottomBarProvider.setIndex(index);
          _pageController.jumpToPage(index); // 페이지 컨트롤러의 인덱스 조정
        },
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Note'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Page'),
        ],
      )
          : null,
    );
  }
}
