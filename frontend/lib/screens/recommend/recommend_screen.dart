// recommend_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/search/search_text_screen.dart';

class RecommendScreen extends StatefulWidget {
  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  late Future<void> _fetchRecommendations;

  @override
  void initState() {
    super.initState();
    _fetchRecommendations = _initializeRecommendations();
  }

  Future<void> _initializeRecommendations() async {
    final recommendProvider = Provider.of<RecommendProvider>(context, listen: false);
    await recommendProvider.fetchRecommendWineList('view');
    await recommendProvider.fetchRecommendWineList('tasting-note');
    await recommendProvider.fetchRecommendWineList('preference');
    await recommendProvider.fetchRecommendWineList('cellar');
    await recommendProvider.fetchRecommendWineList('rate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommend'),
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
      body: FutureBuilder<void>(
        future: _fetchRecommendations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading recommendations.'));
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
              SliverList(
                delegate: SliverChildListDelegate([
                  // 와인 추천 섹션들
                  _buildWineRecommendationSection(
                    context,
                    title: '🔥 오늘의 인기 TOP 10 와인',
                    recommendType: 'view',
                  ),
                  _buildWineRecommendationSection(
                    context,
                    title: '🙊 꼭 마셔보세요! 회원님을 위한 와인',
                    recommendType: 'tasting-note',
                  ),
                  _buildWineRecommendationSection(
                    context,
                    title: '💘 예상 평점이 높은 와인',
                    recommendType: 'preference',
                  ),
                  _buildWineRecommendationSection(
                    context,
                    title: '👀 회원님을 위해 엄선한 오늘의 와인',
                    recommendType: 'cellar',
                  ),
                  _buildWineRecommendationSection(
                    context,
                    title: '👏 평단의 찬사를 받은 와인',
                    recommendType: 'rate',
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  // 와인 추천 섹션을 위한 공통 메서드
  Widget _buildWineRecommendationSection(
      BuildContext context, {
        required String title,
        required String recommendType,
      }) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: AppFontSizes.large,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RecommendWineCardWidget(context, recommendType: recommendType),
          ],
        ),
      ),
    );
  }
}
