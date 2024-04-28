import 'package:flutter/material.dart';

// constants
import 'package:frontend/constants/colors.dart';

class SearchTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 나타날 때 리사이즈하지 않도록 설정
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3), // 좌우 패딩
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.orange, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2), // 그림자의 위치 조정
                ),
              ],
              borderRadius: BorderRadius.circular(30), // 테두리 둥글게
            ),
            child: TextField(
              autofocus: true, // 텍스트 상자에 자동 포커스 되면서 키보드 켜짐
              decoration: InputDecoration(
                hintText: '와인 검색',
                prefixIcon: Icon(Icons.search), // 검색 아이콘
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min, // 아이콘들을 끝쪽에 붙이기 위해
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {
                            // 카메라 아이콘 동작 구현
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            // 닫기 아이콘 동작 구현
                          },
                        ),
                      ],
                    )
                  ],
                ),
                border: InputBorder.none, // 텍스트 필드 테두리 제거
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('최근 검색'),
            ],
          ),
          Container(
            margin: EdgeInsets.all(3),
            width: double.infinity,
            height: 500,
            color: Colors.amber,
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
