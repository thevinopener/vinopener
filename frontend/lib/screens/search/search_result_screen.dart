// flutter
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
// provider
import 'package:frontend/providers/search/search_wine_list_provider.dart';
// widgets
import 'package:frontend/widgets/search/search_bar_widget.dart';
import 'package:frontend/widgets/search/search_wine_list_widget.dart';
// package
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchValue;
  final bool isWineType;

  const SearchResultScreen(
      {super.key, required this.searchValue, this.isWineType = false});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
    // 검색어를 통해 API 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchWineListProvider =
          Provider.of<SearchWineListProvider>(context, listen: false);
      // isWineType 플래그에 따라 적절한 검색 함수 호출
      if (widget.isWineType) {
        searchWineListProvider.findByWineType(widget.searchValue);
      } else {
        searchWineListProvider.findByWineName(widget.searchValue);
      }
    });
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
                return SearchWineListSkeleton(context);
              } else {
                if (searchProvider.wineTypeList.isEmpty) {
                  // 로딩이 끝난 후 검색 결과 표시
                  return Expanded(
                    child: searchProvider.wineNameList.isEmpty
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
                                    '총 ${searchProvider.wineNameList.length}건의 검색결과',
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
                                  child: searchProvider.wineNameList.isEmpty
                                      ? Center(child: Text('검색 결과가 없습니다.'))
                                      : SearchWineListWidget(
                                          context, searchProvider.wineNameList),
                                ),
                              ],
                            ),
                          ),
                  );
                } else {
                  // 로딩이 끝난 후 검색 결과 표시
                  return Expanded(
                    child: searchProvider.wineTypeList.isEmpty
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
                                    '총 ${searchProvider.wineTypeList.length}건의 검색결과',
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
                                  child: searchProvider.wineTypeList.isEmpty
                                      ? Center(child: Text('검색 결과가 없습니다.'))
                                      : SearchWineListWidget(
                                          context, searchProvider.wineTypeList),
                                ),
                              ],
                            ),
                          ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

// 스켈레톤 UI
Widget SearchWineListSkeleton(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: [
        SizedBox(height: 40),
        Column(
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: ElevatedButton(
                onPressed: null,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사진 부분 시작
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.maxFinite,
                          height: 200,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Container(color: Colors.grey[200]!),
                        ),
                      ),
                      // 사진 부분 끝

                      // 정보 부분 시작
                      Flexible(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              SizedBox(height: 5),
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              SizedBox(height: 5),
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 정보 부분 끝
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 150),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );
}