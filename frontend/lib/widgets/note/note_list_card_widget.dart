import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  final WineNoteCard wineNoteCard;

  const NoteCard({super.key, required this.wineNoteCard});

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width;

    return Container(
      width: dimension * 0.91,
      height: dimension * 0.5,
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
              // 왼쪽 컨테이너 (색상 표시용)
              Container(
                width: dimension * 0.09,
                decoration: ShapeDecoration(
                  color: WineColors.wineColorMap[wineNoteCard.color.name] ??
                      Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              // 오른쪽 컨테이너 (이미지 표시용)
              Container(
                width: dimension * 0.31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(wineNoteCard.wine.imageUrl),
                    fit: BoxFit.fitHeight, // 이미지가 컨테이너를 꽉 채우도록 설정
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
                      wineNoteCard.wine.winery,
                      style: TextStyle(
                          fontSize: AppFontSizes.mediumSmall,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      wineNoteCard.wine.name,
                      style: TextStyle(fontSize: AppFontSizes.small),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        NationFlag(
                          country: wineNoteCard.wine.country,
                          height: 12,
                          width: 12,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          wineNoteCard.wine.country,
                          style: TextStyle(fontSize: AppFontSizes.small),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const int maxFlavoursToShow = 5;
                          List<Widget> flavourWidgets = wineNoteCard.flavours
                              .take(maxFlavoursToShow)
                              .map((flavour) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              flavour.taste,
                              style: TextStyle(
                                fontSize: AppFontSizes.verySmall,
                                color: AppColors.black,
                              ),
                            ),
                          ))
                              .toList();

                          // 조건을 추가하여, 향의 수가 최대 표시 수량보다 많을 경우 '...' 추가
                          if (wineNoteCard.flavours.length > maxFlavoursToShow) {
                            flavourWidgets.add(
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  '...',
                                  style: TextStyle(
                                    fontSize: AppFontSizes.verySmall,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            );
                          }

                          return Wrap(
                            children: flavourWidgets,
                          );
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.secondary,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      wineNoteCard.rating.toString(),
                      style: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
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
