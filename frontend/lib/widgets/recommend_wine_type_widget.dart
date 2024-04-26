// flutter
import 'package:flutter/material.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

// 색상 매핑 함수
Color getColorFromWineButtonColor(String color) {
  switch (color) {
    case '로제':
      return Color(0xFFFC585D);
    case '화이트':
      return Color(0xFF00A388);
    case '스파클링':
      return Color(0xFF009AB4);
    default:
      return Color(0xFFCE4F8B); // 기본값 설정
  }
}

Widget RecommendWineTypeWidget(String text) {
  return ElevatedButton(
    onPressed: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/BarIcon.png',
          width: 35,
          height: 35,
        ),
        Text('$text',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: AppFontSizes.verySmall,
          ),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: getColorFromWineButtonColor(text), // 색상 매개변수 사용
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 20),
    ),
  );
}