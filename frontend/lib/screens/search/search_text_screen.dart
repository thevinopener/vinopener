// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// constants
import 'package:frontend/constants/fonts.dart';

// provider
import 'package:frontend/providers/search/search_history_provider.dart';
import 'package:frontend/screens/recommend/recommend_screen.dart';
import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:frontend/screens/wine/wine_search_screen.dart';

// screens
import 'package:frontend/widgets/search/search_bar_widget.dart';
import 'package:provider/provider.dart';

class SearchTextScreen extends StatefulWidget {
  _SearchTextScreenState createState() => _SearchTextScreenState();
}

class _SearchTextScreenState extends State<SearchTextScreen> {
  late SearchHistoryProvider searchHistoryProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchHistoryProvider =
          Provider.of<SearchHistoryProvider>(context, listen: false);
      searchHistoryProvider.loadHistory(); // 처음 빌드할 때 기록 로드
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchHistoryProvider = Provider.of<SearchHistoryProvider>(context);
    var recentSearchList = searchHistoryProvider.historyList.reversed.toList();

    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 나타날 때 리사이즈하지 않도록 설정
      body: Container(
        color: Colors.purple.withOpacity(0.03),
        child: Column(
          children: [
            Row(
              children: [
                // #1 검색바 시작
                Flexible(
                  child: SearchBarWidget(
                    autoFocus: true,
                    contextType: SearchContext.searchTextScreen,
                  ), // 검색바 위젯
                ),
                // #1 검색바 끝
                // IconButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => RecommendScreen(),
                //       ),
                //     );
                //   },
                //   icon: Icon(
                //     Icons.arrow_back,
                //     size: 25,
                //   ),
                //   alignment: Alignment.center,
                // ),
              ],
            ),
            // #2 최근검색, 검색기록삭제 시작
            Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 7, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '최근 검색',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSizes.mediumLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // 전체 기록 삭제 호출
                        searchHistoryProvider.deleteAllSearchHistory();
                      },
                      child: Text(
                        '전체기록삭제',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600),
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
              child: recentSearchList.isEmpty
                  ? Center(
                      child: Text(
                        '최근 검색기록이 없습니다.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppFontSizes.mediumLarge,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                          recentSearchList.length,
                          (index) => Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         SearchResultScreen(
                                      //             searchValue:
                                      //                 recentSearchList[index]
                                      //                     .content),
                                      //   ),
                                      // );
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) => WineSearchScreen(keyword: recentSearchList[index].content)),
                                      );
                                    },
                                    child: Text(
                                      recentSearchList[index].content,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: AppFontSizes.mediumSmall,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      // Align the button's content to the left
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              20), // Remove any default padding that might center the text
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    searchHistoryProvider
                                        .deleteSearchHistoryById(
                                      recentSearchList[index].id,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                  iconSize: 20,
                                )
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
      ),
    );
  }
}
