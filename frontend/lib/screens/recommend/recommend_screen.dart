import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/recommend/recommend_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/search/search_text_screen.dart';

import 'package:frontend/widgets/recommend/recommend_wine_type_widget.dart';

class RecommendScreen extends StatefulWidget {
  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeRecommendations();
    });
  }

  Future<void> _initializeRecommendations() async {
    final recommendProvider =
        Provider.of<RecommendProvider>(context, listen: false);
    await recommendProvider.fetchAllRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 135,
          height: 22.5,
        ),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchTextScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
            label: const Text(''),
          ),
        ],
      ),
      body: Consumer<RecommendProvider>(
        builder: (context, recommendProvider, _) {
          if (recommendProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
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
                          alignment: Alignment.center,
                          child: Text('여따가 와인병 눕혀놀거임 $index',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24)),
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
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        initialPage: 0,
                      ),
                    ),
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 15),
                                  Text('종류',
                                      style: TextStyle(
                                        fontSize: AppFontSizes.large,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text('어떤 종류의 와인을 좋아하시나요?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppFontSizes.mediumSmall)),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // 버튼을 시작점에 정렬
                                children: [
                                  RecommendWineTypeWidget(context, '레드'),
                                  Spacer(flex: 1),
                                  RecommendWineTypeWidget(context, '로제'),
                                  Spacer(flex: 1),
                                  RecommendWineTypeWidget(context, '화이트'),
                                  Spacer(flex: 1),
                                  RecommendWineTypeWidget(context, '스파클링'),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),

                      // 🔥 오늘의 인기 TOP 10 와인
                      _ContentTitleSection(context,
                          title: '🔥 오늘의 인기 TOP 10 와인'),
                      RecommendCarouselWidget(context, recommendType: 'view'),

                      // 🙊 꼭 마셔보세요! 회원님을 위한 와인
                      _ContentTitleSection(context,
                          title: '🙊 꼭 마셔보세요! 회원님을 위한 와인'),
                      RecommendCarouselWidget(context,
                          recommendType: 'tasting-note'),

                      // 💘 예상 평점이 높은 와인
                      _ContentTitleSection(context, title: '💘 예상 평점이 높은 와인'),
                      RecommendCarouselWidget(context,
                          recommendType: 'preference'),

                      // 👀 회원님을 위해 엄선한 오늘의 와인
                      _ContentTitleSection(context,
                          title: '👀 회원님을 위해 엄선한 오늘의 와인'),
                      RecommendCarouselWidget(context, recommendType: 'cellar'),

                      // 👏 평단의 찬사를 받은 와인
                      _ContentTitleSection(context, title: '👏 평단의 찬사를 받은 와인'),
                      RecommendCarouselWidget(context, recommendType: 'rate'),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _ContentTitleSection(
    BuildContext context, {
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.centerLeft, // 텍스트를 좌측 중앙 정렬
          children: [
            /// 밑줄 역할을 할 컨테이너
            Positioned(
              bottom: 2, // 텍스트 바닥에서 조금 위에 위치하도록 설정
              left: 40, // 왼쪽 정렬
              child: Container(
                width: 105, // 밑줄의 길이를 텍스트의 대략적인 너비로 설정
                height: 8, // 높이를 낮춰서 밑줄처럼 보이게 설정
                color: Colors.yellow.withOpacity(0.7), // 투명도를 조절하여 스타일 적용
              ),
            ),
            // 텍스트 위젯
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFontSizes.large,
                backgroundColor: Colors.transparent, // 텍스트 배경을 투명하게 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}