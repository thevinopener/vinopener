import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/search/search_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/search/search_text_screen.dart';

import 'package:frontend/widgets/search/search_wine_type_widget.dart';

import '../../widgets/search/search_wine_nation_widget.dart';

class RecommendScreen extends StatefulWidget {
  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final bannerImg  = ['assets/images/banner1.png', 'assets/images/banner2.png'];

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
                itemCount: bannerImg.length, // 이미지 수만큼 아이템 카운트 설정
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width, // 컨테이너 너비를 화면 너비에 맞춤
                      height: 250, // 고정 높이 설정
                      child: Image.asset(
                        bannerImg[index], // 현재 인덱스에 해당하는 이미지 로드
                        fit: BoxFit.scaleDown, // 이미지를 컨테이너에 맞추어 표시
                      ),
                    );
                  },
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 250, // 캐러셀 높이 설정
                    autoPlay: true, // 자동 재생 활성화
                    autoPlayInterval: Duration(seconds: 5), // 자동 재생 간격
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index; // 현재 페이지 인덱스 업데이트
                      });
                    },
                    enlargeCenterPage: false, // 중앙 페이지 확대
                    viewportFraction: 1.0, // 뷰포트 비율
                    initialPage: 0, // 초기 페이지 인덱스
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
                                  Text('🌈 종류',
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
                      SearchCarouselWidget(context, recommendType: 'view'),

                      // 🙊 꼭 마셔보세요! 회원님을 위한 와인
                      _ContentTitleSection(context,
                          title: '🙊 꼭 마셔보세요! 회원님을 위한 와인'),
                      SearchCarouselWidget(context,
                          recommendType: 'tasting-note'),

                      Container(
                        // color: Colors.deepPurple,
                        width: double.maxFinite,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('🌏 국가',
                                      style: TextStyle(
                                        fontSize: AppFontSizes.large,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text('오늘은 어떤 나라의 와인을 마셔볼까요?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppFontSizes.mediumSmall)),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            SearchWineNationWidget(context),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),

                      // 💘 예상 평점이 높은 와인
                      _ContentTitleSection(context, title: '💘 예상 평점이 높은 와인'),
                      SearchCarouselWidget(context,
                          recommendType: 'preference'),

                      // 👀 회원님을 위해 엄선한 오늘의 와인
                      _ContentTitleSection(context,
                          title: '👀 회원님을 위해 엄선한 오늘의 와인'),
                      SearchCarouselWidget(context, recommendType: 'cellar'),

                      // 👏 평단의 찬사를 받은 와인
                      _ContentTitleSection(context, title: '👏 평단의 찬사를 받은 와인'),
                      SearchCarouselWidget(context, recommendType: 'rate'),
                      SizedBox(
                        height: 20,
                      ),
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

  Widget _ContentTitleSection(BuildContext context, {required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // TextPainter를 사용하여 텍스트의 너비를 계산합니다.
          final TextPainter textPainter = TextPainter(
            text: TextSpan(
                text: title,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: AppFontSizes.large)),
            maxLines: 1,
            textDirection: TextDirection.ltr,
          );
          textPainter.layout(
              minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);
          final double textWidth = textPainter.width;

          return Stack(
            alignment: Alignment.centerLeft, // 텍스트를 좌측 중앙 정렬
            children: [
              // 밑줄 역할을 할 컨테이너
              Positioned(
                bottom: 2, // 텍스트 바닥에서 조금 위에 위치하도록 설정
                left: 40, // 왼쪽 정렬
                child: Container(
                  width: 100, // 밑줄의 길이를 텍스트의 너비에 맞춥니다.
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
          );
        },
      ),
    );
  }
}
