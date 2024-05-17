import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
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

Widget SearchCarouselWidget(BuildContext context,
    {required String recommendType}) {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  final recommendProvider =
      Provider.of<RecommendProvider>(context, listen: false);
  List<RecommendWine> wineList;
  String? type;

  // recommendType에 따라 해당 목록을 선택
  switch (recommendType) {
    case 'view':
      wineList = recommendProvider.viewRecommendWineList;
      type = '조회 수';
      break;
    case 'preference':
      wineList = recommendProvider.preferenceRecommendWineList;
      type = '설문조사';
      break;
    case 'tasting-note':
      wineList = recommendProvider.tastingNoteRecommendWineList;
      type = '테이스팅노트';
      break;
    case 'cellar':
      wineList = recommendProvider.cellarRecommendWineList;
      type = '셀러';
      break;
    case 'rate':
      wineList = recommendProvider.rateRecommendWineList;
      type = '평점';
      break;
    case 'wine-detail':
      wineList = recommendProvider.wineDetailRecommendWineList;
      type = '현재 와인과 유사한 와인';
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
          // Text(
          //   '${type}(을/를) 작성해주세요',
          //   style: TextStyle(
          //     fontSize: AppFontSizes.mediumSmall,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
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
                    onLongPress: () {
                      showToastWidget(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: AppColors.black,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.thumb_up, color: Colors.white),
                              SizedBox(width: 10.0),
                              Text(
                                'Good Choice! 더 알아보러 가시죠!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppFontSizes.medium,
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Icon(Icons.thumb_up, color: Colors.white),
                            ],
                          ),
                        ),
                        context: context,
                        duration: Duration(seconds: 2),
                        position: StyledToastPosition(
                          align:
                              Alignment(0, -0.4), // 좌상단 (-1, -1) / 우하단 (1, 1)
                        ),
                      );
                    },
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchDetailScreen(
                                    wineId: wineList[index].wineId,
                                  )));
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
                                  color: RecommendTypeToColor(recommendType)
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
                              child: Image(
                                  image: CachedNetworkImageProvider(
                                      wineList[index].imageUrl)),
                            ),
                          ),
                          // 생산국가
                          // Positioned(
                          //   top: 25,
                          //   left: 0,
                          //   child: Text(
                          //     wineList[index].country,
                          //     style: TextStyle(
                          //       color: AppColors.black,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),
                          // 와이너리명
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
                          // Positioned(
                          //   top: 0,
                          //   left: 0,
                          //   // bottom: 10,
                          //   // right: 0,
                          //   // left: 0,
                          //   child: Text(
                          //     // wineList[index].name,
                          //     replaceSpacesWithNewline(wineList[index].name),
                          //     textAlign: TextAlign.left, // 텍스트를 오른쪽으로 정렬
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.w600),
                          //   ),
                          // ),
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
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
