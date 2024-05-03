import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/wineLabel.dart';
import 'package:frontend/models/wine_model.dart';

class WineItem extends StatelessWidget {
  final Wine wine;

  WineItem({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: ElevatedButton(
        onPressed: () {
          // 클릭 시 해당 와인 이름을 SearchResultScreen에 전달
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SearchDetailScreen()));
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
                        color: Colors.white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                        borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                        border: Border.all(
                          color: Colors.black, // 테두리 색상
                          width: 1, // 테두리 두께
                        ),
                      ),
                      child: Image.network(
                        '${wine.imageUrl}',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: wineLabel('${wine.type}'.toLowerCase()),
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
                                '${wine.winery}',
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
                          '${wine.name}',
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
                              '${wine.country}',
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
          elevation:
          0,
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
  }
}