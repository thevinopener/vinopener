import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Providers
import 'package:frontend/providers/recommend_provider.dart';

// Screens
import 'package:frontend/screens/search/search_text_screen.dart';

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommend'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => RecommendProvider().moveToSearchTextScreen(context),
            icon: const Icon(Icons.search),
            label: const Text(''),
          )
        ],
      ),
      
      body: Center( // 전체 요소 중앙정렬
        child: Column(  // 전체요소를 쌓을 칼럼
          children: [
            Container(  // 카로셀 배너
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    color: Colors.red,
                    width: double.maxFinite,
                    height: 500,
                    child: Text('카로셀 자리'),
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  aspectRatio: 1,
                  viewportFraction: 1,
                )
              ),
            ),

            Container( // 와인 종류별
              alignment: Alignment.bottomLeft,
              height: 100, width: double.maxFinite,
              // crossAxisAlignment: CrossAxisAlignment.start,
              color: Colors.yellow,
              child: Container(
                width: double.maxFinite,
                height: 200,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('1')),
                    ElevatedButton(onPressed: () {}, child: Text('2')),
                    ElevatedButton(onPressed: () {}, child: Text('3')),
                    ElevatedButton(onPressed: () {}, child: Text('4')),
                  ],
                ),

              )
              // children: [
              //   Text('종류'),
              //   Text('좋아하는 와인의 종류를 선택해보세요 !'),
              // ],
            ),
            Container(  // 와인 추천1을 쌓을 칼럼
              height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (int i = 1; i <= 5; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            height: 100,
                            width: 200,
                            child: Text('와인 $i'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
      // const Center(
      //   child: Text('recommend_screen.dart',
      //     style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.w700
      //     ),),
      // ),
    );
  }
}