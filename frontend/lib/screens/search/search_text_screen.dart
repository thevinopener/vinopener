// flutter
import 'package:flutter/material.dart';

// screens
import 'package:frontend/widgets/search/search_bar_widget.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/search/search_wine_list_widget.dart';

class SearchTextScreen extends StatefulWidget {
  _SearchWinePageState createState() => _SearchWinePageState();
}

class _SearchWinePageState extends State<SearchTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 나타날 때 리사이즈하지 않도록 설정
      body: Column(
        children: [
          // #1 검색바 시작
          Flexible(
            child: SearchBarWidget(), // 검색바 위젯
          ),
          // #1 검색바 끝

          // #2 최근검색, 검색기록삭제 시작
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최근 검색',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppFontSizes.mediumLarge,
                    ),
                  ),
                  TextButton(
                      onPressed: () => {
                        // TODO: 검색기록삭제 로직 작성
                      },
                      child: Text(
                        '검색 기록 삭제',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
          // #2 최근검색, 검색기록삭제 끝

          // #3 검색 기록 시작
          Flexible(
            flex: 9,
            child: SearchWineListWidget(context),
          ),
          // #3 검색 기록 끝
        ],
      ),
    );
  }
}
