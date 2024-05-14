import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:provider/provider.dart';

import '../../models/recommend/recommend_wine_list.dart';
import '../../providers/recommend_provider.dart';
import '../../utils/api_client.dart';

// 공백 -> Enter (de la 제외)
String replaceSpacesWithNewline(String input) {
  List<String> words = input.split(' ');
  StringBuffer sb = StringBuffer();
  for (int i = 0; i < words.length; i++) {
    if (i != 0) {
      if (words[i - 1].endsWith('de') && words[i].startsWith('la')) {
        sb.write(' ');
      } else {
        sb.write('\n');
      }
    }
    sb.write(words[i]);
  }
  return sb.toString();
}

Color RecommendTypeToColor(int wineId) {
  if (wineId % 6 == 0) {
    return Color(0xFFCE4F8B);
  } else if (wineId % 6 == 1) {
    return Color(0xFFFC585D);
  } else if (wineId % 6 == 2) {
    return Color(0xFF00A388);
  } else if (wineId % 6 == 3) {
    return Color(0xFF009AB4);
  } else if (wineId % 6 == 4) {
    return Color(0xFF5A189A);
  } else {
    return Color(0xFFFF8500);
  }
}

Widget SearchWineDetailRecommendWidget(
  BuildContext context, {
  required String recommendType,
  required int wineId,
}) {
  final CarouselController _carouselController = CarouselController();

  final recommendProvider =
      Provider.of<RecommendProvider>(context, listen: false);
  List<RecommendWine> wineList;
  String? type;

  // recommendType에 따라 해당 목록을 선택
  switch (recommendType) {
    case 'wine-detail':
      wineList = recommendProvider.wineDetailRecommendWineList;
      type = '현재 와인과 유사한 와인';
      break;
    default:
      wineList = [];
      break;
  }

  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.4;

  if (wineList.isEmpty) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 35, 10, 35),
      margin: EdgeInsets.fromLTRB(10, 35, 10, 35),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '😂 회원님에 대해 더 알려주세요 😂',
            style: TextStyle(
              fontSize: AppFontSizes.mediumLarge,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\"${type}\" ',
                style: TextStyle(
                    color: AppColors.primary.withOpacity(0.7),
                    fontSize: AppFontSizes.medium,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                ' 기반 추천이에요',
                style: TextStyle(
                  fontSize: AppFontSizes.mediumSmall,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  } else {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
            ),
            child: CarouselSlider.builder(
              itemCount: wineList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  color: Colors.transparent,
                  width: double.maxFinite,
                  height: 50,
                  alignment: Alignment.center,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchDetailScreen(
                            wineId: wineList[index].wineId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Transform.rotate(
                              angle: 0.4,
                              child: Container(
                                width: 60,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: RecommendTypeToColor(wineId)
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            child: Transform.rotate(
                              angle: 0.8, // 1.57이 눕히는거
                              child: Image.network(wineList[index].imageUrl),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Text(
                              replaceSpacesWithNewline(wineList[index].winery),
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        ContinuousRectangleBorder(
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 250,
                autoPlay: false,
                aspectRatio: 6,
                enlargeCenterPage: false,
                viewportFraction: 0.4,
                initialPage: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}