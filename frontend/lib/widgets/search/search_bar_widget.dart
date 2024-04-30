// flutter
import 'package:flutter/material.dart';

// screens
import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:frontend/screens/search/search_camera_screen.dart';

// constants
import 'package:frontend/constants/fonts.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchValue);
  }

  void _handleSubmitted(String value) {
    print("입력된 값: $value");
    if (widget.contextType == SearchContext.searchTextScreen) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SearchResultScreen(value)));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SearchResultScreen(value)));
    }
  }

  @override
  Widget build(BuildContext) {
    return Container(
      margin: EdgeInsets.all(10),
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 3), // 좌우 패딩
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
              controller: _controller,
              // 컨트롤러 연결 -> X버튼 누르면 없어지는 것과 연결됨
              autofocus: widget.autoFocus,
              // 텍스트 상자에 자동 포커스 되면서 키보드 켜짐
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '와인 검색',
                hintStyle:
                TextStyle(color: Colors.grey), // hint 텍스트의 색상 설정
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
              onPressed: () {
                // 카메라 아이콘 동작 구현
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchCameraScreen()));
              },
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