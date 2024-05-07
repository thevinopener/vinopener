// flutter
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// screens
import 'package:frontend/screens/search/search_camera_screen.dart';

// constants

import '../../screens/note/note_search_result_screen.dart';

enum SearchContext { searchTextScreen, searchResultScreen }

class NoteSearchBarWidget extends StatefulWidget {

  final String searchValue;
  final bool autoFocus;
  final SearchContext contextType;

  NoteSearchBarWidget({
    this.autoFocus = false,
    this.searchValue = '',
    this.contextType = SearchContext.searchTextScreen,
  });

  @override
  _NoteSearchBarWidgetState createState() => _NoteSearchBarWidgetState();
}

class _NoteSearchBarWidgetState extends State<NoteSearchBarWidget> {

  late TextEditingController _controller;
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchValue);
  }

  void _handleSubmitted(String value) {
    print("입력된 값: $value");
    if (widget.contextType == SearchContext.searchTextScreen) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NoteSearchResultScreen(value)));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NoteSearchResultScreen(value)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10), // 좌우 패딩
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(30), // 테두리 둥글게
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
        children: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey), // 검색 아이콘
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              autofocus: widget.autoFocus,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: '와인 검색',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none, // 밑줄 제거
                contentPadding: EdgeInsets.symmetric(vertical: 0), // 텍스트 필드 내의 상하 패딩 조절
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}
