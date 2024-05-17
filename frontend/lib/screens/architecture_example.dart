import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ArchitectureExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 여기가 전체 배경임
      body: Container(
        color: Colors.purple.withOpacity(0.04), // 전체 뒷배경색
        padding: EdgeInsets.all(10),  // 상하좌우 여백
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // 전체 배경(화면의 모든 요소를 감싸고 있음)에 세로로 요소를 쌓을 것임.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // 행 정렬
          crossAxisAlignment: CrossAxisAlignment.center,  // 열 정렬
          children: [


            // 검색바 시작
            Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 행 정렬
                    crossAxisAlignment: CrossAxisAlignment.center,  // 열 정렬
                    children: [
                      // TODO 여기다가 검색바 요소 배치.. 혹시 TextField한개로 끝나면 Row 없애도 됨
                    ],
                  ),
                ),
            ),
            // 검색바 끝



            // Text('총 ${list.length}개의 검색결과') 시작
            Flexible(
              flex: 1,
              child: Container(
                child: Text('총 n개의 검색결과'),  // TODO: 리스트 길이 바인딩 할 곳
              ),
            ),
            // Text('총 ${list.length}개의 검색결과') 끝



            // 검색결과 리스트 뿌리기 시작
            Flexible(
              flex: 8,
              child: Container(
                // child: PagedListView(
                //   physics: BouncingScrollPhysics(),
                // ),
                // TODO: 위 주석풀고 페이지네이션 데이터 뿌리는 코드 옮기면 됨.
              ),
            ),
            // 검색결과 리스트 뿌리기 끝



          ],
        ),
      ),
    );
  }

}