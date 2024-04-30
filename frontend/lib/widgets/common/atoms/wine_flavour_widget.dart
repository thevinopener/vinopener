import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/icon.dart';

import '../../../constants/colors.dart';
import '../../../models/note_model.dart';

class WineFlavour extends StatelessWidget {
  final Flavour flavour;

  const WineFlavour({super.key, required this.flavour});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width * 0.18;

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
          Container(
            alignment: Alignment.center,
            height: dimension * 0.7,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: AssetImage(WineIcon.Flavour[flavour.taste] ??
                    'assets/images/penguin.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            height: dimension * 0.3,
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
              flavour.taste,
              style: TextStyle(fontSize: AppFontSizes.verySmall),
            ),
          ),
        ],
      ),
    );
  }
}
