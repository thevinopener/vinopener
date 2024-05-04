import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

import '../../models/wine_model.dart';

class NoteWineCard extends StatelessWidget {
  final Wine wine;

  const NoteWineCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width;

    return Container(
      width: dimension * 0.91,
      height: dimension * 0.4,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFCACACB)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x1418274B),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -2,
          )
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: dimension * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(
                        wine.imageUrl ?? 'assets/default_image.jpg'),
                    // 널 대체 이미지
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: dimension * 0.03),
            width: dimension * 0.5,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color(0xFFCACACB),
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wine.winery ?? 'Unknown Winery', // 널 대체 텍스트
                  style: TextStyle(
                      fontSize: AppFontSizes.mediumSmall,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  wine.name ?? 'Unknown Wine', // 널 대체 텍스트
                  style: TextStyle(fontSize: AppFontSizes.small),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    NationFlag(height: 12, width: 12),
                    SizedBox(width: 5,),
                    Text(
                      wine.country ?? 'Unknown Country', // 널 대체 텍스트
                      style: TextStyle(fontSize: AppFontSizes.small),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
