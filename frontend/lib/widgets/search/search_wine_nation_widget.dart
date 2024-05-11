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

Widget SearchWineNationWidget(BuildContext context) {
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
    '미국',
    '이탈리아',
    '프랑스', '아르헨티나', '칠레', '스페인', '호주'
  ];

  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.8; // 정사각형 형태로 가로 길이 설정

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
                // 이미지를 버튼 배경으로 사용합니다.
                // image: DecorationImage(
                //   image: AssetImage("assets/path/to/your/image.png"), // 이미지 경로 지정
                //   fit: BoxFit.cover, // 이미지를 정사각형 크기에 맞게 조절
                // ),
                borderRadius: BorderRadius.circular(15), // 버튼의 테두리를 둥글게
              ),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchResultScreen(
                              searchValue: wineNationList[index],
                              isNation: true
                          )
                      )
                  );
                },
                child: Text(
                  wineNationList[index],
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppFontSizes.large,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(cardWidth, cardWidth), // 버튼 크기 고정
                  backgroundColor: Colors.transparent, // 배경색 투명
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  side: BorderSide(color: Colors.transparent),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
              ),
            );
          },
          carouselController: _carouselController,
          options: CarouselOptions(
            height: cardWidth + 20, // Carousel의 높이 설정
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.3, // 뷰포트 분수 조절
            initialPage: 0,
          ),
        ),
      ],
    ),
  );
}
