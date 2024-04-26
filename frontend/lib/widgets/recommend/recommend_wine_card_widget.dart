// flutter
import 'package:flutter/material.dart';

// constants
import 'package:frontend/constants/fonts.dart';

// TODO: 국가명 빼고, 국가명을 기준으로 카드 우상단에 동그란 국기 아이콘 넣기
Widget RecommendWineCardWidget() {
  return Container(
    height: 350,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
              (index) => Padding(
            padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
            child: ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 200,  // 이미지 컨테이너의 크기 조정 부분
                    height: 150,
                    color: Colors.white12,  // 이미지 배경색
                    child: Image.asset(
                      'assets/images/dummy_wine.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Vieilles Vigne Chorey-lès-Beaune 2018',
                        style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Michel Gay & Fils',
                        style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.w400,
                          color: Colors.orange,
                        ),),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/ea.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text('스페인',
                            style: TextStyle(
                              fontSize: AppFontSizes.small,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 300),  // 버튼 크기를 조정
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
              ),
            ),
          ),
        ),
      ),
    ),
  );
}