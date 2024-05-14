import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/widgets/search/search_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/search/search_text_screen.dart';

import 'package:frontend/widgets/search/search_wine_type_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/api_client.dart';
import '../../widgets/search/search_wine_nation_widget.dart';

class RecommendScreen extends StatefulWidget {
  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final bannerImg = ['assets/images/banner1.png', 'assets/images/banner2.png'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeRecommendations();
    });

    print(
        '============================================================================');
    print(
        '============================ ACCESS TOKEN START ============================');
    print('recommend_screen.dart의 initState 입니다. 아래는 나의 엑세스 토큰입니다.');
    print('MY ACCESS TOKEN : ' + ApiClient.getAccessToken());
    print(
        '============================= ACCESS TOKEN END =============================');
    print(
        '============================================================================');
  }

  Future<void> _initializeRecommendations() async {
    final recommendProvider =
        Provider.of<RecommendProvider>(context, listen: false);
    await recommendProvider.fetchViewRecommendations();
    await recommendProvider.fetchTastingNoteRecommendations();
    await recommendProvider.fetchPreferenceRecommendations();
    await recommendProvider.fetchCellarRecommendations();
    await recommendProvider.fetchRateRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        // leading: 좌측
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/vinopener_logo.png',
              height: 45, // 이미지 크기 조절
              width: 45, // 이미지 크기 조절
            ),
            SizedBox(width: 8), // 이미지와 텍스트 사이의 간격
            Text(
              'VINOPENER',
              style: TextStyle(
                  fontSize: AppFontSizes.mediumLarge,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        leadingWidth: double.maxFinite,
        // title: 가운데
        // title: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
        //     Image.asset(
        //       'assets/images/vinopener_logo.png',
        //       height: 40, // 이미지 크기 조절
        //       width: 50, // 이미지 크기 조절
        //     ),
        //     SizedBox(width: 8), // 이미지와 텍스트 사이의 간격
        //     Text(
        //       'VINOPENER',
        //       style: TextStyle(
        //           fontSize: AppFontSizes.large, fontWeight: FontWeight.w600),
        //     ),
        //   ],
        // ),
        // centerTitle: true, // 제목을 중앙에 위치
        // action: 동작
        actions: <Widget>[
          // 검색 아이콘 버튼
          Padding(
            padding: EdgeInsets.only(right: 4), // 오른쪽 여백 추가
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchTextScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.05),
        ),
        child: Consumer<RecommendProvider>(
          builder: (context, recommendProvider, _) {
            if (recommendProvider.isLoading) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    // 스켈레톤 와인 이미지
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            margin: const EdgeInsets.all(20),
                            color: Colors.grey[200],
                          ),
                          Container(
                            width: 250,
                            height: 30,
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            color: Colors.grey[200],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return Container(
                                width: 80,
                                height: 80,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 5, 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            }),
                          ),
                          Container(
                            width: 300,
                            height: 40,
                            margin: const EdgeInsets.all(20),
                            color: Colors.grey[200],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
                            width: MediaQuery.of(context)
                                .size
                                .width, // 컨테이너 너비를 화면 너비에 맞춤
                            height: 250, // 고정 높이 설정
                            child: Image.asset(
                              bannerImg[index], // 현재 인덱스에 해당하는 이미지 로드
                              fit: BoxFit.fill, // 이미지를 컨테이너에 맞추어 표시
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                            fontSize:
                                                AppFontSizes.mediumSmall)),
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
                          width: double.maxFinite,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '🌏 국가',
                                style: TextStyle(
                                  fontSize: AppFontSizes.large,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text('오늘은 어떤 나라의 와인을 마셔볼까요?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppFontSizes.mediumSmall)),
                            ],
                          ),
                        ),
                        SearchWineNationWidget(context),
                        SizedBox(height: 40),

                        // 💘 예상 평점이 높은 와인
                        _ContentTitleSection(context, title: '💘 예상 평점이 높은 와인'),
                        SearchCarouselWidget(context,
                            recommendType: 'preference'),

                        // 👀 회원님을 위해 엄선한 오늘의 와인
                        _ContentTitleSection(context,
                            title: '👀 회원님을 위해 엄선한 오늘의 와인'),
                        SearchCarouselWidget(context, recommendType: 'cellar'),

                        // 👏 평단의 찬사를 받은 와인
                        _ContentTitleSection(context,
                            title: '👏 평단의 찬사를 받은 와인'),
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
                bottom: 2,
                left: 40,
                child: Container(
                  width: 100,
                  height: 8,
                  color: Colors.yellow.withOpacity(0.7),
                ),
              ),
              // 텍스트 위젯
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSizes.large,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
