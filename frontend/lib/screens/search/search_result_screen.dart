import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// constants
import 'package:frontend/constants/colors.dart';

class SearchResultScreen extends StatefulWidget {
  // 사용자가 검색한 값을 저장할 변수
  final String searchValue;

  // 생성자를 통해 검색 값 받기
  SearchResultScreen(this.searchValue);

  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultScreen> {
  TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String value) {
    // 여기서 입력된 값을 사용하여 화면 이동 또는 다른 로직을 수행
    print("입력된 값: $value");
    // 예를 들어, 다음 화면으로 이동:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3), // 좌우 패딩
            child: Text('검색한 단어: ${widget.searchValue}'), // 전달받은 검색 값을 화면에 표시
          ),
        ],
      ),
    );
  }
}
