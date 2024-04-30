import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width;

    return Container(
      width: dimension * 0.91,
      height: dimension * 0.5,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFCACACB)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: dimension * 0.09,
            decoration: ShapeDecoration(
              color: WineColors.wineColorMap[note.color.name],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
            ),
          ),
          Container(
            width: dimension * 0.31,
            alignment: Alignment.center,
            child: Image.network(
              note.wine.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: dimension*0.03),
            width: dimension * 0.5,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color(0xFFCACACB), // 왼쪽 선의 색상 설정
                  width: 1.0, // 선의 두께
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      note.wine.winery,
                      style: TextStyle(fontSize: AppFontSizes.mediumSmall, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      note.wine.name,
                      style: TextStyle(fontSize: AppFontSizes.small),
                    ),
                    Row(
                      children: [
                        NationFlag(height: 12, width: 12),
                        Text(
                          note.wine.country,
                          style: TextStyle(fontSize: AppFontSizes.small),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "향",
                      style: TextStyle(fontSize: AppFontSizes.mediumSmall),
                    ),
                    SizedBox(width: 10), // "향" 텍스트와 다음 요소 사이의 간격 추가
                    Expanded(
                      // Expanded를 사용하여 텍스트 넘침을 방지
                      child: Wrap(
                        // Row 대신 Wrap 사용
                        children: note.flavours
                            .map((flavour) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  // 각 향 요소 사이에 오른쪽 패딩 추가
                                  child: Text(flavour.taste),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      note.rating.toString(),
                      style: TextStyle(
                          fontSize: AppFontSizes.mediumSmall,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
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
