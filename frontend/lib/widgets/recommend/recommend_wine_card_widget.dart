import 'package:flutter/material.dart';

Widget RecommendWineCardWidget(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;  // 장치의 화면 너비를 얻습니다.
  double cardWidth = screenWidth * 0.4;  // 각 카드의 너비를 화면 너비의 40%로 설정합니다.

  return Container(
    height: 350,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
              (index) => Padding(
            padding: EdgeInsets.only(right: 20, left: index == 0 ? 20 : 0),  // 첫 번째 요소에 왼쪽 패딩을 추가
            child: ElevatedButton(
              onPressed: () {
                // 클릭 시 수행할 작업
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: cardWidth,  // 동적으로 계산된 너비를 사용
                        height: 190,
                        color: Colors.white12,
                        // color: Colors.orange,
                        child: Image.asset(
                          'assets/images/dummy_wine.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Image.asset('assets/images/ea.png', width: 20, height: 20),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Vieilles Vigne Chorey-lès-Beaune 2018',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Michel Gay & Fils',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(cardWidth, 300),  // 동적으로 계산된 너비를 사용
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.grey, width: 1),
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
