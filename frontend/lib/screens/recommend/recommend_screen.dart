// flutter
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Providers
import 'package:frontend/providers/recommend_provider.dart';

// Screens
import 'package:frontend/screens/search/search_text_screen.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

class RecommendScreen extends StatefulWidget {
  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State {
  int _current = 0; // 현재 페이지 인덱스를 추적
  final CarouselController _carouselController =
      CarouselController(); // Carousel 컨트롤러

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommend'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () =>
                RecommendProvider().moveToSearchTextScreen(context),
            icon: const Icon(Icons.search),
            label: const Text(''),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      // 카로셀 높이
                      alignment: Alignment.center,
                      child: Text('카로셀 자리 $index',
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                    );
                  },
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width,
                    autoPlay: true,
                    aspectRatio: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    initialPage: 0,
                  ),
                ),
              ],
            ),
          ),
          // 카로셀 끝

          // 와인 종류별 버튼 시작 #2
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('종류', style: TextStyle(fontSize: AppFontSizes.large)),
                    Text('좋아하는 와인의 종류를 선택하세요',
                        style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 버튼을 시작점에 정렬
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('1'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WineButtonColors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                          ),
                        ),
                        Spacer(flex: 1),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('2'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WineButtonColors.rose,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                          ),
                        ),
                        Spacer(flex: 1),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('3'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WineButtonColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                          ),
                        ),
                        Spacer(flex: 1),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('4'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WineButtonColors.sparkling,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // 와인 종류별 버튼 끝 #2

                // 와인 추천1 시작 #3-1
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    // 전체 패딩 추가
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천1) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 100, // 충분한 높이를 지정하여 버튼이 보일 수 있도록 설정
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                            child: Row(
                              children: List.generate(
                                5,
                                (index) => // 5개의 버튼을 생성
                                    Padding(
                                  padding: EdgeInsets.only(
                                      right: index < 4 ? 10 : 0),
                                  // 마지막 버튼을 제외하고 오른쪽 패딩 추가
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('${index + 1}'), // 버튼에 숫자 표시
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          WineButtonColors.sparkling,
                                      // 모든 버튼 같은 색상
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 와인 추천1 끝 #3-1

                // 와인 추천2 시작 #3-2
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    // 전체 패딩 추가
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천2) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 100, // 충분한 높이를 지정하여 버튼이 보일 수 있도록 설정
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => // 5개의 버튼을 생성
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: index < 4 ? 10 : 0),
                                  // 마지막 버튼을 제외하고 오른쪽 패딩 추가
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('${index + 1}'), // 버튼에 숫자 표시
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      WineButtonColors.sparkling,
                                      // 모든 버튼 같은 색상
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 와인 추천2 끝 #3-2

                // 와인 추천3 시작 #3-3
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    // 전체 패딩 추가
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천3) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 100, // 충분한 높이를 지정하여 버튼이 보일 수 있도록 설정
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => // 5개의 버튼을 생성
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: index < 4 ? 10 : 0),
                                  // 마지막 버튼을 제외하고 오른쪽 패딩 추가
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('${index + 1}'), // 버튼에 숫자 표시
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      WineButtonColors.sparkling,
                                      // 모든 버튼 같은 색상
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 와인 추천3 끝 #3-3

                // 와인 추천4 시작 #3-4
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    // 전체 패딩 추가
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천4) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 100, // 충분한 높이를 지정하여 버튼이 보일 수 있도록 설정
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => // 5개의 버튼을 생성
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: index < 4 ? 10 : 0),
                                  // 마지막 버튼을 제외하고 오른쪽 패딩 추가
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('${index + 1}'), // 버튼에 숫자 표시
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      WineButtonColors.sparkling,
                                      // 모든 버튼 같은 색상
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 와인 추천4 끝 #3-4

                // 와인 추천5 시작 #3-5
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    // 전체 패딩 추가
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천5) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 100, // 충분한 높이를 지정하여 버튼이 보일 수 있도록 설정
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => // 5개의 버튼을 생성
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: index < 4 ? 10 : 0),
                                  // 마지막 버튼을 제외하고 오른쪽 패딩 추가
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('${index + 1}'), // 버튼에 숫자 표시
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      WineButtonColors.sparkling,
                                      // 모든 버튼 같은 색상
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 와인 추천5 끝 #3-5
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
