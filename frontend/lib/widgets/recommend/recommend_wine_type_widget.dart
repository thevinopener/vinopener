// flutter
import 'package:flutter/material.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

// Screen
import 'package:frontend/screens/search/search_result_screen.dart';

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

// void _handleSubmitted(String value) {
//   // 여기서 입력된 값을 사용하여 화면 이동 또는 다른 로직을 수행
//   print("입력된 값: $value");
//   // 다음 화면으로 이동:
//   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(value)));
// }

Widget RecommendWineTypeWidget(BuildContext context, String text) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(searchValue: text)));
    },
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