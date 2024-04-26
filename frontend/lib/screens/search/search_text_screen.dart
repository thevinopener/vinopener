import 'package:flutter/material.dart';

class SearchTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // 검색바를 상단에 고정
        SliverAppBar(
          pinned: true,  // 상단에 고정
          title: TextField(
            decoration: InputDecoration(
              hintText: '검색',
            ),
          ),
        ),
        // 동적으로 변하는 리스트
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              // 여기서 API 데이터를 가지고 각 아이템을 구성합니다.
              // 예를 들어, searchResults는 API로부터 받은 검색 기록 리스트
              return ListTile(
                // title: Text(searchResults[index]),
              );
            },
            // childCount: searchResults.length,  // 검색 결과의 수에 따라 리스트 길이 결정
          ),
        ),
      ],
    );
  }
}