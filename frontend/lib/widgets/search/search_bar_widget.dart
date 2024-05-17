// flutter
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/providers/search/search_history_provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/search/search_camera_screen.dart';
// screens
import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:frontend/screens/wine/type_search_screen.dart';
import 'package:frontend/screens/wine/wine_search_screen.dart';
import 'package:provider/provider.dart';

import '../../screens/recommend/recommend_screen.dart';

enum SearchContext { searchTextScreen, searchResultScreen }

class SearchBarWidget extends StatefulWidget {
  final String searchValue;
  bool autoFocus;
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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _initCameras();
    _controller = TextEditingController(text: widget.searchValue);
    _focusNode = FocusNode(); // FocusNode 초기화

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          widget.autoFocus = false; // 포커스를 잃었을 때 autoFocus를 false로 설정
        });
      }
    });
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
          // MaterialPageRoute(
          //     builder: (context) => SearchResultScreen(searchValue: value)));
          // MaterialPageRoute(
          //     builder: (context) => TypeSearchScreen(type: value)));
          CupertinoPageRoute(
              builder: (context) => WineSearchScreen(keyword: value)));
    } else {
      await Navigator.pushReplacement(
          context,
          // MaterialPageRoute(
          //     builder: (context) => SearchResultScreen(searchValue: value)));
          // MaterialPageRoute(
          //     builder: (context) => WineSearchScreen(keyword: value)));
          CupertinoPageRoute(
          builder: (context) => TypeSearchScreen(type: value)));
    }
    Provider.of<SearchHistoryProvider>(context, listen: false).loadHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3), // 좌우 패딩
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary, width: 3),
        borderRadius: BorderRadius.circular(30), // 테두리 둥글게
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 8,
            child: TextField(
              // 컨트롤러 연결 -> X버튼 누르면 없어지는 것과 연결됨
              controller: _controller,
              focusNode: _focusNode, // FocusNode 연결
              autofocus: widget.autoFocus,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: '와인 검색',
                hintStyle: TextStyle(color: Colors.grey), // hint 텍스트의 색상 설정
                prefixIcon:
                    // Icon(Icons.search,
                    // color: Colors.grey,), // 검색 아이콘
                    IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                  alignment: Alignment.center,
                ),
                border: InputBorder.none, // 밑줄 제거
              ),
              // textAlign: TextAlign.center,
              onSubmitted: _handleSubmitted, // 완료 버튼 클릭 이벤트
            ),
          ),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              alignment: Alignment.center,
              onPressed: _isCameraInitialized
                  ? () {
                      Navigator.of(context).pushReplacement(
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
                setState(
                      () {
                    _controller.clear();
                    _focusNode.requestFocus(); // FocusNode를 사용하여 자동 포커스
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}