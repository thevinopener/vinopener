// flutter
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/note/note_search_list_widget.dart';

// package
import 'package:provider/provider.dart';

// widgets
import 'package:frontend/widgets/search/search_bar_widget.dart';
import 'package:frontend/widgets/search/search_wine_list_widget.dart';

// provider
import 'package:frontend/providers/search/search_wine_list_provider.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchValue;

  const SearchResultScreen({super.key, required this.searchValue});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
    // 검색어를 통해 API 호출
    final searchWineListProvider = Provider.of<SearchWineListProvider>(context, listen: false);
    searchWineListProvider.findByWineName(widget.searchValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(
            autoFocus: false,
            searchValue: widget.searchValue,
            contextType: SearchContext.searchResultScreen,
          ),
          Consumer<SearchWineListProvider>(
            builder: (context, searchProvider, child) {
              if (searchProvider.isLoading) {
                // 로딩 중일 때 로딩 화면을 표시
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: double.infinity,
                              child: const CircularProgressIndicator(
                                color: AppColors.primary, // 예시로 색상 변경
                                strokeWidth: 8,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 335,
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Loading...',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                // 로딩이 끝난 후 검색 결과 표시
                return Expanded(
                  child: searchProvider.wineList.isEmpty
                      ? Center(
                          child: Text('검색 결과가 없습니다.'),
                        )
                      : Container(
                          height: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                                child: Text(
                                  '총 ${searchProvider.wineList.length}건의 검색결과',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  softWrap: true, // 감싸주는 애
                                  overflow: TextOverflow
                                      .ellipsis, // 글자수 넘치면 ... 으로 바꿔주는애
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: searchProvider.wineList.isEmpty
                                    ? Center(child: Text('검색 결과가 없습니다.'))
                                    : SearchWineListWidget(
                                        context, searchProvider.wineList),
                              ),
                            ],
                          ),
                        ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
