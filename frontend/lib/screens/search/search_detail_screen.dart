// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDetailScreen extends StatefulWidget {
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ),
      body: Column(
        children: [
          // #1 와인정보 시작
          // #1 와인정보 끝

          // #2 아로마노트 시작
          // #2 아로마노트 끝

          // #3 맛 오각형 시작
          // #3 맛 오각형 끝

          // #4 다른와인추천 시작
          // #4 다른와인추천 끝

          // #5 BottmBar 
        ],
      ),
    );
  }
}