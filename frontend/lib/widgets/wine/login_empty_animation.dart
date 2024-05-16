import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/search/search_wine_name_result.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../providers/recommend_provider.dart';
import '../../providers/search/search_wine_list_provider.dart';
import '../../screens/search/search_result_screen.dart';

Widget LoginEmptyAnimation(BuildContext context) {
  final CarouselController _carouselController = CarouselController();
  final wineNationList = [
    'United States',
    'Italy',
    'France',
    'Argentina',
    'Chile',
    'Spain',
    'Australia'
  ];
  final nationImg = [
    'assets/images/us.jpg',
    'assets/images/it.jpg',
    'assets/images/fr.jpg',
    'assets/images/ar.jpg',
    'assets/images/ch.jpg',
    'assets/images/sp.jpg',
    'assets/images/au.jpg'
  ];

  String translateCountryName(String country) {
    final Map<String, String> translations = {
      'United States': '미국',
      'Italy': '이탈리아',
      'France': '프랑스',
      'Argentina': '아르헨티나',
      'Chile': '칠레',
      'Spain': '스페인',
      'Australia': '호주'
    };

    return translations[country] ?? '알 수 없는 국가';
  }

  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.5; // 정사각형 형태로 가로 길이 설정

  return Container(
    width: double.maxFinite,
    child: Column(
      children: [
        CarouselSlider.builder(
          itemCount: wineNationList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: cardWidth, // 버튼 너비 설정
              height: cardWidth, // 버튼 높이를 너비와 동일하게 설정하여 정사각형 만듦
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(nationImg[index]), // 이미지 경로 지정
                  fit: BoxFit.cover, // 이미지를 정사각형 크기에 맞게 조절
                ),
                borderRadius: BorderRadius.circular(15), // 버튼의 테두리를 둥글게
              ),
              child: Container(
                width: cardWidth,
                height: cardWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                ),
                child: Text(
                  translateCountryName(wineNationList[index]),
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppFontSizes.veryLarge,
                  ),
                ),
              ),
            );
          },
          carouselController: _carouselController,
          options: CarouselOptions(
            height: cardWidth + 20, // Carousel의 높이 설정
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.6, // 뷰포트 분수 조절
            initialPage: 0,
          ),
        ),
      ],
    ),
  );
}
