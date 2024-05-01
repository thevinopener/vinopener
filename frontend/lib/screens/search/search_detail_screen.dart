// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDetailScreen extends StatefulWidget {
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Container(
          width: 300,
          height: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 30),
                    const SizedBox(width: 30),
                    const SizedBox(width: 30),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 6,
                padding: const EdgeInsets.only(right: 111.11),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 188.89,
                      height: 6,
                      decoration: ShapeDecoration(
                        color: Color(0xFFCFDC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Detail',
    //       style: TextStyle(
    //         color: Colors.black,
    //       ),
    //     )
    //   ),
    //   body: Column(
    //     children: [
    //       // #1 와인정보 시작
    //         // d
    //       // #1 와인정보 끝
    //
    //       // #2 아로마노트 시작
    //       // #2 아로마노트 끝
    //
    //       // #3 맛 오각형 시작
    //       // #3 맛 오각형 끝
    //
    //       // #4 다른와인추천 시작
    //       // #4 다른와인추천 끝
    //
    //       // #5 BottmBar
    //     ],
    //   ),
    // );
  }
}