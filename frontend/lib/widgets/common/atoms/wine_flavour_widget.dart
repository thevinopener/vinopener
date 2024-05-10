import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/icon.dart';

import '../../../constants/colors.dart';
import '../../../models/note_model.dart';

class WineFlavour extends StatelessWidget {
  final Flavour flavour;
  final bool isSelected;

  const WineFlavour({super.key, required this.flavour, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width * 0.19;

    // 외부 Container 추가
    return Container(
      width: dimension,
      height: dimension,
      padding: EdgeInsets.all(dimension / 20),
      // 선택된 상태에 따라 두꺼운 테두리를 조건부로 적용
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary, width: 2.0), // 두꺼운 테두리 적용
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent, width: 2.0), // 두꺼운 테두리 적용
      ),
      child: Container(
        width: dimension*0.9,
        height: dimension*0.9,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: -4,
            )
          ],
        ),
        child:
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: dimension * 0.55,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(WineIcon.Flavour[flavour.taste] ?? 'assets/images/penguin.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: dimension * 0.23,
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
                flavour.taste,
                style: TextStyle(fontSize: AppFontSizes.verySmall),
              ),
            ),
          ],
        ),),
    );
  }
}
