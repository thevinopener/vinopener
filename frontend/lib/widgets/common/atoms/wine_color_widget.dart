import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class WineColor extends StatelessWidget {
  final Color wineColor;
  final String colorName;

  const WineColor({super.key, required this.wineColor, required this.colorName});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width * 0.2;

    return Container(
      width: dimension,
      height: dimension,
      margin: EdgeInsets.all(dimension / 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: ShapeDecoration(
                color: wineColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: dimension / 2,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            child: Text(
              colorName,
              style: TextStyle(fontSize: AppFontSizes.mediumSmall),
            ),
          ),
        ],
      ),
    );
  }
}

