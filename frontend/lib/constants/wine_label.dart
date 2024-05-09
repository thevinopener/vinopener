import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

Widget wineLabel(String type) {

  Color labelColor;
  switch (type) {
    case 'red':
      labelColor = WineButtonColors.red;
      break;
    case 'white':
      labelColor = WineButtonColors.white;
      break;
    case 'rose':
      labelColor = WineButtonColors.rose;
      break;
    case 'sparkling':
      labelColor = WineButtonColors.sparkling;
      break;
    default:
      labelColor = Colors.grey; // 기본 값
  }

  return Container(
    width: 80,
    height: 20,
    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    decoration: BoxDecoration(
      color: labelColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(7)), // 모서리 둥글게
      // border: Border.all(
      //   color: Colors.white, // 테두리 색상
      //   width: 0, // 테두리 두께
      // ),
    ),
    alignment: Alignment.center,
    child: Text(
      type.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.small,
      ),
    ),
  );
}
