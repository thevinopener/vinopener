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
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary, width: 1.0), // 두꺼운 테두리 적용
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1.0), // 두꺼운 테두리 적용
      ),
        child:
        Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
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
            ),
            Container(
              alignment: Alignment.topCenter,
              height: dimension * 0.25,
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
        ),
    );
  }
}
