// flutter
import 'package:flutter/material.dart';
import 'package:frontend/screens/search/search_result_screen.dart';

// screens
import 'package:frontend/widgets/search/search_bar_widget.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/search/search_wine_list_widget.dart';

class SearchTextScreen extends StatefulWidget {
  _SearchTextScreenState createState() => _SearchTextScreenState();
}

final List<String> recentSearchList = [
  "양희승이 좋아하는 와인",
  "전원빈이 좋아하는 와인",
  "최지웅이 좋아하는 와인",
  "고영훈이 좋아하는 와인",
  "한정수가 좋아하는 와인",
  "박희찬이 좋아하는 와인",
  "양희승이 좋아하는 와인",
  "전원빈이 좋아하는 와인",
  "최지웅이 좋아하는 와인",
  "고영훈이 좋아하는 와인",
  "한정수가 좋아하는 와인",
  "박희찬이 좋아하는 와인",
  "양희승이 좋아하는 와인",
  "전원빈이 좋아하는 와인",
  "최지웅이 좋아하는 와인",
  "고영훈이 좋아하는 와인",
  "한정수가 좋아하는 와인",
  "박희찬이 좋아하는 와인",
  "양희승이 좋아하는 와인",
  "전원빈이 좋아하는 와인",
  "최지웅이 좋아하는 와인",
  "고영훈이 좋아하는 와인",
  "한정수가 좋아하는 와인",
  "박희찬이 좋아하는 와인",
];

class _SearchTextScreenState extends State<SearchTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 나타날 때 리사이즈하지 않도록 설정
      body: Column(
        children: [
          // #1 검색바 시작
          Flexible(
            child: SearchBarWidget(autoFocus: true, contextType: SearchContext.searchTextScreen,), // 검색바 위젯
          ),
          // #1 검색바 끝

          // #2 최근검색, 검색기록삭제 시작
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      '전체기록삭제',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w400),
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  recentSearchList.length,
                  (index) => Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(searchValue: recentSearchList[index]),
                              ),
                            );
                          },
                          child: Text(
                            recentSearchList[index],
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w400, fontSize: AppFontSizes.mediumSmall),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.clear), iconSize: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // #3 검색 기록 끝
        ],
      ),
    );
  }
}
