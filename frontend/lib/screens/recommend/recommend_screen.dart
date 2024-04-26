// flutter
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Providers
import 'package:frontend/providers/recommend_provider.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

// Widgets
import 'package:frontend/widgets/recommend_wine_type_widget.dart';

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
                    height: 250,
                    autoPlay: true,
                    aspectRatio: 3,
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
                    Text('종류',
                        style: TextStyle(
                          fontSize: AppFontSizes.large,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    Text('어떤 종류의 와인을 좋아하시나요?',
                        style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // 버튼을 시작점에 정렬
                      children: [
                        RecommendWineTypeWidget('레드'),
                        Spacer(flex: 1),
                        RecommendWineTypeWidget('로제'),
                        Spacer(flex: 1),
                        RecommendWineTypeWidget('화이트'),
                        Spacer(flex: 1),
                        RecommendWineTypeWidget('스파클링'),
                      ],
                    ),
                  ],
                ),
                // 와인 종류별 버튼 끝 #2

                SizedBox(height: 30), // 섹션 간의 간격 추가
                
                // 와인 추천1 시작 #3-1
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천1) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,  // 이미지 컨테이너의 크기 조정 부분
                                          height: 150,
                                          color: Colors.white12,  // 이미지 배경색
                                          child: Image.asset(
                                            'assets/images/dummy_wine.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vieilles Vigne Chorey-lès-Beaune 2018',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Michel Gay & Fils',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.orange,
                                              ),),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset('assets/images/ea.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text('스페인',
                                                  style: TextStyle(
                                                    fontSize: AppFontSizes.small,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(200, 300),  // 버튼 크기를 조정
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천2) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,  // 이미지 컨테이너의 크기 조정 부분
                                          height: 150,
                                          color: Colors.white12,  // 이미지 배경색
                                          child: Image.asset(
                                            'assets/images/dummy_wine.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vieilles Vigne Chorey-lès-Beaune 2018',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Michel Gay & Fils',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.orange,
                                              ),),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset('assets/images/ea.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text('스페인',
                                                  style: TextStyle(
                                                    fontSize: AppFontSizes.small,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(200, 300),  // 버튼 크기를 조정
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천3) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,  // 이미지 컨테이너의 크기 조정 부분
                                          height: 150,
                                          color: Colors.white12,  // 이미지 배경색
                                          child: Image.asset(
                                            'assets/images/dummy_wine.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vieilles Vigne Chorey-lès-Beaune 2018',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Michel Gay & Fils',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.orange,
                                              ),),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset('assets/images/ea.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text('스페인',
                                                  style: TextStyle(
                                                    fontSize: AppFontSizes.small,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(200, 300),  // 버튼 크기를 조정
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천4) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,  // 이미지 컨테이너의 크기 조정 부분
                                          height: 150,
                                          color: Colors.white12,  // 이미지 배경색
                                          child: Image.asset(
                                            'assets/images/dummy_wine.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vieilles Vigne Chorey-lès-Beaune 2018',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Michel Gay & Fils',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.orange,
                                              ),),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset('assets/images/ea.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text('스페인',
                                                  style: TextStyle(
                                                    fontSize: AppFontSizes.small,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(200, 300),  // 버튼 크기를 조정
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이런(추천5) 와인은 어떠세요?',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumLarge,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 5), // 버튼과의 간격 추가
                        Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(right: index < 4 ? 20 : 0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,  // 이미지 컨테이너의 크기 조정 부분
                                          height: 150,
                                          color: Colors.white12,  // 이미지 배경색
                                          child: Image.asset(
                                            'assets/images/dummy_wine.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vieilles Vigne Chorey-lès-Beaune 2018',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Michel Gay & Fils',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.orange,
                                              ),),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset('assets/images/ea.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text('스페인',
                                                  style: TextStyle(
                                                    fontSize: AppFontSizes.small,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(200, 300),  // 버튼 크기를 조정
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.grey, width: 1),  // 회색 테두리 추가
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),  // ElevatedButton 내부 패딩 (좌상우하 순 설정)
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
