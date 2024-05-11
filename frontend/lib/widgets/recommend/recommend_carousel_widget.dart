import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:provider/provider.dart';

import '../../models/recommend/recommend_wine_list.dart';
import '../../providers/recommend_provider.dart';

// 공백 -> Enter
String replaceSpacesWithNewline(String input) {
  return input.replaceAll(' ', '\n');
}

// TODO: 여기 recommendType 넘기면 색깔 구분해주는 switch 함수 만들기
Color RecommendTypeToColor(String recommendType) {
  switch (recommendType) {
    case 'view':
      return Color(0xFFCE4F8B);
    case 'preference':
      return Color(0xFFFC585D);
    case 'tasting-note':
      return Color(0xFF00A388);
    case 'cellar':
      return Color(0xFF009AB4);
    case 'rate':
      return Color(0xFF5A189A);
    default:
      return Color(0xFFFF8500);
  }
}


Widget RecommendCarouselWidget(BuildContext context,
    {required String recommendType}) {

  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  final recommendProvider =
      Provider.of<RecommendProvider>(context, listen: false);
  List<RecommendWine> wineList;

  // recommendType에 따라 해당 목록을 선택
  switch (recommendType) {
    case 'view':
      wineList = recommendProvider.viewRecommendWineList;
      break;
    case 'preference':
      wineList = recommendProvider.preferenceRecommendWineList;
      break;
    case 'tasting-note':
      wineList = recommendProvider.tastingNoteRecommendWineList;
      break;
    case 'cellar':
      wineList = recommendProvider.cellarRecommendWineList;
      break;
    case 'rate':
      wineList = recommendProvider.rateRecommendWineList;
      break;
    default:
      wineList = [];
      break;
  }

  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.4;

  return Column(
    children: [
      CarouselSlider.builder(
        itemCount: wineList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: FilledButton(
              onPressed: () {},
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
                            color: RecommendTypeToColor(recommendType).withOpacity(0.3),
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
                    // 와인명과 와이너리명
                    // Positioned(
                    //   top: 10,
                    //   left: 10,
                    //   child: Text(
                    //     // wineList[index].name,
                    //     replaceSpacesWithNewline(
                    //         wineList[index].name,
                    //     ),
                    //     textAlign: TextAlign.left, // 텍스트를 오른쪽으로 정렬
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: AppFontSizes.mediumSmall,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        replaceSpacesWithNewline(wineList[index].winery),
                        textAlign: TextAlign.right, // 텍스트를 오른쪽으로 정렬
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
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
                  // Colors.indigo.withOpacity(0.2),
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
          // onPageChanged: (index, reason) {
          //   setState(() {
          //     _current = index;
          //   });
          // },
          enlargeCenterPage: false,
          viewportFraction: 0.4,
          initialPage: 0,
        ),
      ),
      SizedBox(height: 60,)
    ],
  );
}
