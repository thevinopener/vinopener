import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class WineLabel extends StatelessWidget {
  String type;

  WineLabel({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: WineButtonColors.getColor(type),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      width: 80,
      height: 20,
      child: Text(
        '${type}',
        style: TextStyle(
          color: Colors.white,
          fontSize: type == 'SPARKLING' ? AppFontSizes.verySmall : AppFontSizes.small,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
