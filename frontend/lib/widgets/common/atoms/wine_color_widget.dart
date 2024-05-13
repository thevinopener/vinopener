import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class WineColorBlock extends StatelessWidget {
  final Color? wineColor;
  final String? colorName;

  const WineColorBlock({super.key, required this.wineColor, required this.colorName});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width * 0.2;

    return Container(
      width: dimension,
      height: dimension,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  side: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

