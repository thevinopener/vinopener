// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/label.dart';

// screens
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/constants/label.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

// 예제 데이터 리스트
List<List<String>> wineNames = [
  ["More Wine Name 2020", "와이너리3", "국가3", "port"],
  ["More Wine Name 2020", "와이너리3", "국가3", "red"],
  ["More Wine Name 2020", "와이너리3", "국가3", "red"],
  ["More Wine Name 2020", "와이너리4", "국가4", "rose"],
  ["More Wine Name 2020", "와이너리5", "국가5", "white"],
  ["More Wine Name 2020", "와이너리6", "국가6", "sparkling"],
  ["More Wine Name 2020", "와이너리7", "국가7", "red"],
  ["More Wine Name 2020", "와이너리8", "국가8", "white"],
  ["More Wine Name 2020", "와이너리9", "국가9", "sparkling"],
  ["More Wine Name 2020", "와이너리10", "국가10", "rose"],
  ["More Wine Name 2020", "와이너리11", "국가11", "red"],
];

Widget SearchWineListWidget(BuildContext context) {
  return Container(
    // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    // width: double.infinity,
    // color: Colors.amber, // TODO: 영역구분 임시 색칠
    child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            wineNames.length, // 리스트 개수에 따라 동적으로 생성
            (index) => Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: 여기에 클릭했을 때 로직 작성
                  // 클릭 시 해당 와인 이름을 SearchResultScreen에 전달
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchDetailScreen()));
                },
                child: Container(
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 좌측 정렬
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사진 부분 시작
                      Flexible(
                        flex: 4,
                        child: Stack(
                          children: [
                            Container(
                              width: double.maxFinite, // 이미지 컨테이너의 크기 조정 부분
                              height: 200,
                              // color: Colors.white, // 이미지 배경색
                              // color: Color(0xFFF8F8F8),
                              child: Image.asset(
                                'assets/images/dummy_wine.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: wineLabel(wineNames[index][3]),
                            ),
                          ],
                        ),
                      ),
                      // 사진 부분 끝

                      // 정보 부분 시작
                      Flexible(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        wineNames[index][1],
                                        style: TextStyle(
                                          fontSize: AppFontSizes.mediumSmall,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Flexible(
                                    //   child: IconButton(
                                    //     alignment: Alignment.centerRight,
                                    //     onPressed: () {},
                                    //     icon: Icon(Icons.star_outline),
                                    //     iconSize: 27,
                                    //     padding:
                                    //         EdgeInsets.zero, // 패딩 제거하여 더 우측 끝으로
                                    //     constraints:
                                    //         BoxConstraints(), // 제약 조건 최소화
                                    //     color: AppColors.primary,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Text(
                                  wineNames[index][0],
                                  style: TextStyle(
                                    fontSize: AppFontSizes.medium,
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
                  elevation:
                      0, // Fucking 그림자 제거 -> 이거 없으면 회색같이 나옴 ElevatedButton의 특징임 젠장.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1), // 회색 테두리 추가
                  ),
                  padding: EdgeInsets.fromLTRB(
                      10, 10, 10, 10), // ElevatedButton 내부 패딩 (좌상우하 순 설정)
                ),
              ),
            ),
          ),
        )),
    // #3 검색 기록 끝
  );
}
