import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:frontend/widgets/search/search_bar_widget.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

class SearchTextScreen extends StatefulWidget {
  _SearchWinePageState createState() => _SearchWinePageState();
}

class _SearchWinePageState extends State<SearchTextScreen> {

  // 예제 데이터 리스트
  final List<List<String>> wineNames = [
    ["Vieilles Vigne Chorey-lès-Beaune 2018", "와이너리1", "국가1"],
    ["Another Wine Name 2019", "와이너리2", "국가2"],
    ["More Wine Name 2020", "와이너리3", "국가3"],
    ["More Wine Name 2020", "와이너리4", "국가4"],
    ["More Wine Name 2020", "와이너리5", "국가5"],
    ["More Wine Name 2020", "와이너리6", "국가6"],
    ["More Wine Name 2020", "와이너리7", "국가7"],
    ["More Wine Name 2020", "와이너리8", "국가8"],
    ["More Wine Name 2020", "와이너리9", "국가9"],
    ["More Wine Name 2020", "와이너리10", "국가10"],
    ["More Wine Name 2020", "와이너리11", "국가11"],
  ];

  // TextEditingController _controller = TextEditingController();
  //
  // void _handleSubmitted(String value) {
  //   // 여기서 입력된 값을 사용하여 화면 이동 또는 다른 로직을 수행
  //   print("입력된 값: $value");
  //   // 다음 화면으로 이동:
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => SearchResultScreen(value)));
  // }

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
          Flexible(
            child: // #2 최근검색, 검색기록삭제 시작
                Container(
              margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
              // color: Colors.yellow,
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
                      onPressed: () => {},
                      child: Text(
                        '검색 기록 삭제',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
          ),
          // #2 최근검색, 검색기록삭제 끝

          // #3 검색 기록 시작
          Flexible(
            flex: 9,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              width: double.infinity,
              // color: Colors.amber, // TODO: 영역구분 임시 색칠
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      wineNames.length, // 리스트 개수에 따라 동적으로 생성
                      (index) => Padding(
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: 여기에 클릭했을 때 로직 작성
                            // 클릭 시 해당 와인 이름을 SearchResultScreen에 전달
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchResultScreen(wineNames[index][0])
                                )
                            );
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start, // 좌측 정렬
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // 사진 부분 시작
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    width: 100, // 이미지 컨테이너의 크기 조정 부분
                                    height: 100,
                                    // color: Colors.white12, // 이미지 배경색
                                    // color: Colors.yellow,
                                    child: Image.asset(
                                      'assets/images/dummy_wine.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                // 사진 부분 끝

                                // 정보 부분 시작
                                Flexible(
                                  flex: 7,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    width: double.maxFinite,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  wineNames[index][1],
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFontSizes.mediumSmall,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: IconButton(
                                                  alignment: Alignment.centerRight,
                                                  onPressed: () {},
                                                  icon: Icon(Icons.star_outline),
                                                  iconSize: 27,
                                                  padding: EdgeInsets.zero, // 패딩 제거하여 더 우측 끝으로
                                                  constraints: BoxConstraints(), // 제약 조건 최소화
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Text(
                                            wineNames[index][0],
                                            style: TextStyle(
                                              fontSize:
                                                AppFontSizes.medium,
                                                color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/ea.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                wineNames[index][2],
                                                style: TextStyle(
                                                  fontSize: AppFontSizes.small,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
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
                            fixedSize: Size(double.infinity, 150), // 버튼 크기를 조정
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  color: Colors.grey, width: 1), // 회색 테두리 추가
                            ),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10), // ElevatedButton 내부 패딩 (좌상우하 순 설정)
                          ),
                        ),
                      ),
                    ),
                  )),
              // #3 검색 기록 끝
            ),
          ),
        ],
      ),
    );
  }
}
