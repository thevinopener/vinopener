// flutter
import 'package:flutter/material.dart';
// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/wine_label.dart';
// screens
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

Widget SearchWineListWidget(BuildContext context, List<dynamic> wineList) {
  return Container(
    // TODO: 만약 검색 결과 없으면 '${searchValue}와 일치하는 결과가 없습니다.' 안내문구 띄우기 (if/else)로 구분
    // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    // width: double.infinity,
    // color: Colors.amber,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          wineList.length, // 리스트 개수에 따라 동적으로 생성
          (index) {
            final wine = wineList[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: ElevatedButton(
                onPressed: () {
                  // 클릭 시 해당 와인 이름을 SearchResultScreen에 전달
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchDetailScreen(
                                wineId: wine.id,
                              )));
                },
                child: Container(
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 좌측 정렬
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사진 부분 시작
                      Flexible(
                        flex: 3,
                        child: Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              // 이미지 컨테이너의 크기 조정 부분
                              height: 200,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              // color: Colors.white, // 이미지 배경색
                              // color: Color(0xFFF0F0F0), // 이미지 배경색
                              decoration: BoxDecoration(
                                color: Colors
                                    .white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                                borderRadius:
                                    BorderRadius.circular(5), // 모서리 둥글게
                                border: Border.all(
                                  color: Colors.black, // 테두리 색상
                                  width: 1, // 테두리 두께
                                ),
                              ),
                              child: Image.network(wine.imageUrl,
                                  fit: BoxFit.scaleDown),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: wineLabel(wine.type.toLowerCase()),
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
                          // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                        wine.name,
                                        style: TextStyle(
                                          fontSize: AppFontSizes.mediumSmall,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  wine.winery,
                                  style: TextStyle(
                                    fontSize: AppFontSizes.medium,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    NationFlag(
                                        country: wine.country,
                                        height: 20,
                                        width: 20),
                                    SizedBox(width: 10),
                                    Text(
                                      wine.country,
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
                  fixedSize: Size(double.infinity, 150),
                  // 버튼 크기를 조정
                  backgroundColor: Colors.white,
                  elevation: 0,
                  // Fucking 그림자 제거 -> 이거 없으면 회색같이 나옴 ElevatedButton의 특징임 젠장.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1), // 회색 테두리 추가
                  ),
                  padding: EdgeInsets.fromLTRB(
                      10, 10, 10, 10), // ElevatedButton 내부 패딩 (좌상우하 순 설정)
                ),
              ),
            );
          },
        ),
      ),
    ),
    // #3 검색 기록 끝
  );
}
