import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

import '../common/atoms/wine_color_widget.dart'; // WineColor 위젯의 올바른 경로를 확인하세요.

class NoteColor extends StatefulWidget {
  const NoteColor({Key? key}) : super(key: key);

  @override
  State<NoteColor> createState() => _NoteColorState();
}

class _NoteColorState extends State<NoteColor> {


  List<String> wineColorNames = [
    "밑집색",
    "노란색",
    "황금색",
    "호박색",
    "갈색",
    "구리색",
    "연어색",
    "분홍색",
    "루비색",
    "보라색",
    "석류색",
    "황갈색",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.width*1.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white, // 컨테이너 배경 색상
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 그림자 색상
            blurRadius: 4, // 흐림 정도
            offset: Offset(0, 4), // 그림자 위치
            spreadRadius: -2, // 그림자 확산 정도
          )
        ],
      ),
      child: GridView.builder(
        itemCount: wineColorNames.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // 그리드 스크롤 방지
        itemBuilder: (context, index) {
          String colorName = wineColorNames[index];
          Color? wineColor = WineColors.wineColorMap[colorName];
          return wineColor != null
              ? WineColorBlock(wineColor: wineColor, colorName: colorName)
              : Container();
        },
      ),
    );
  }
}
