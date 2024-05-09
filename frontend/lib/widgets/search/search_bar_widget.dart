// flutter
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/search/search_history_provider.dart';
import 'package:frontend/screens/search/search_camera_screen.dart';
// screens
import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:provider/provider.dart';

enum SearchContext { searchTextScreen, searchResultScreen }

class SearchBarWidget extends StatefulWidget {
  final String searchValue;
  final bool autoFocus;
  final SearchContext contextType;

  SearchBarWidget({
    this.autoFocus = false,
    this.searchValue = '',
    this.contextType = SearchContext.searchTextScreen,
  });

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCameras();
    _controller = TextEditingController(text: widget.searchValue);
  }

  Future<void> _initCameras() async {
    try {
      cameras = await availableCameras();
      firstCamera = cameras.first;
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print('카메라를 초기화하는 중 에러 발생: $e');
      // 에러 처리 로직 추가
    }
  }

  void _handleSubmitted(String value) async {
    print("입력된 값: $value");
    if (widget.contextType == SearchContext.searchTextScreen) {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchResultScreen(searchValue: value)));
    } else {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SearchResultScreen(searchValue: value)));
    }
    Provider.of<SearchHistoryProvider>(context, listen: false).loadHistory();
  }

  @override
  Widget build(BuildContext) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3), // 좌우 패딩
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(30), // 테두리 둥글게
      ),
      child: Row(
        children: [
          // Flexible(
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       // 뒤로 가기 아이콘 동작 구현
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCameraScreen()));
          //     },
          //   ),
          // ),
          Flexible(
            flex: 8,
            child: TextField(
              // 컨트롤러 연결 -> X버튼 누르면 없어지는 것과 연결됨
              controller: _controller,
              // 텍스트 상자에 자동 포커스 되면서 키보드 켜짐
              autofocus: widget.autoFocus,
              // TODO: 입력값 없으면 검색 안되게 막기
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '와인 검색',
                hintStyle: TextStyle(color: Colors.grey), // hint 텍스트의 색상 설정
                prefixIcon: Icon(Icons.search), // 검색 아이콘
                border: InputBorder.none, // 밑줄 제거
              ),
              onSubmitted: _handleSubmitted, // 완료 버튼 클릭 이벤트
            ),
          ),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              alignment: Alignment.center,
              onPressed: _isCameraInitialized
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchCameraScreen(camera: firstCamera),
                        ),
                      );
                    }
                  : null, // 카메라 초기화가 완료되지 않았을 때는 버튼 비활성화
            ),
          ),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.close),
              alignment: Alignment.center,
              onPressed: () {
                // X 아이콘 동작 구현
                setState(() {
                  _controller.clear();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
