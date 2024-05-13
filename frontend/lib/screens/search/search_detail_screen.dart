// flutter
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// constant
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/providers/search/search_wine_detail_provider.dart';
import 'package:frontend/screens/note/note_screen.dart';
import 'package:frontend/services/search_service.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_flavour_widget.dart';
// pages & widgets & models
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
// package
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/search/search_carousel_widget.dart';
import '../../widgets/search/search_wine_nation_widget.dart';

const Map<String, Color> wineTypeColors = {
  'red': WineButtonColors.red,
  'white': WineButtonColors.rose,
  'rose': WineButtonColors.white,
  'sparkling': WineButtonColors.sparkling,
};

class SearchDetailScreen extends StatefulWidget {
  final int wineId;

  const SearchDetailScreen({required this.wineId, Key? key}) : super(key: key);

  @override
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  // 풍미 초기화
  final ValueNotifier<double> _acidNotifier = ValueNotifier(0);
  final ValueNotifier<double> _bodyNotifier = ValueNotifier(0);
  final ValueNotifier<double> _sweetNotifier = ValueNotifier(0);
  final ValueNotifier<double> _tanninNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchWineDetailProvider =
          Provider.of<SearchWineDetailProvider>(context, listen: false);
      searchWineDetailProvider.findDetailByWineId(widget.wineId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '세부정보',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<SearchWineDetailProvider>(
          builder: (context, wineDetailProvider, child) {
        // 로딩 중인 경우 로딩 화면 표시
        if (wineDetailProvider.isLoading) {
          return SearchDetailSkeleton(context);
        }

        // 와인 상세 정보가 없는 경우 예외 처리
        final wineDetail = wineDetailProvider.wineDetail;
        if (wineDetail == null) {
          return const Center(child: Text('와인 정보를 불러올 수 없습니다.'));
        }

        // 와인 정보가 있는 경우 화면에 표시
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // #1 와인정보 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    ),

                // #1-1 와인이미지, 국기 시작
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          // 이미지 컨테이너의 크기 조정 부분
                          height: 300,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            // color:
                            //     Colors.white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                            borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                          ),
                          child: Image.network(
                            wineDetail.imageUrl,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: NationFlag(
                              country: wineDetail.country,
                              height: 40,
                              width: 40),
                        ),
                        Positioned(
                          top: 70, // 이미지 하단에서부터의 위치
                          right: 20,
                          child: Container(
                            alignment: Alignment.center,
                            // Container 내부에서 중앙 정렬이 필요하면 사용
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            // 좌우 패딩
                            height: 40,
                            // 텍스트 컨테이너의 세로 크기
                            width: 40,
                            decoration: BoxDecoration(
                              color: wineTypeColors[
                                      wineDetail.type.toLowerCase()] ??
                                  Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // #1-1 와인이미지, 국기 끝

                    // #1-2 와인 주요 세부정보 시작

                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // mainAxisAlignment: MainAxisAlignment.center,
                      child: Column(
                        children: [
                          Text(
                            wineDetail.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumLarge,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            wineDetail.winery,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.medium,
                              fontWeight: FontWeight.w300,
                            ),
                            softWrap: true, // 감싸주는 애
                            overflow:
                                TextOverflow.ellipsis, // 글자수 넘치면 ... 으로 바꿔주는애
                          ),
                          Text(
                            // '빈티지',
                            wineDetail.vintage.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumLarge,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primary,
                              ),
                              Text(
                                // ' 4.6',
                                wineDetail.rating.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppFontSizes.large,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Consumer<SearchWineDetailProvider>(
                            builder: (context, wineDetailProvider, child) {
                              final wineDetail = wineDetailProvider.wineDetail;
                              if (wineDetail == null) {
                                return Container();
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wineDetail.isBookmark
                                      ? Container(
                                          width: double.maxFinite,
                                          child: FilledButton(
                                            onPressed: () async {
                                              SearchService.removeBookmark(
                                                  wineDetail.id);
                                              await wineDetailProvider
                                                  .findDetailByWineId(
                                                      widget.wineId);
                                            },
                                            child: Text(
                                              '즐겨찾기 삭제',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            style: FilledButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                color: AppColors.primary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              SearchService.addBookmark(
                                                  wineDetail.id);
                                              await wineDetailProvider
                                                  .findDetailByWineId(
                                                      widget.wineId);
                                            },
                                            child: Text(
                                              '즐겨찾기 추가',
                                              style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: AppFontSizes.medium,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.white,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                  color: AppColors.primary,
                                                  width: 2),
                                            ),
                                          ),
                                        ),
                                  wineDetail.isCellar
                                      ? Container(
                                          width: double.maxFinite,
                                          child: FilledButton(
                                            onPressed: () {
                                              SearchService.removeCellar(
                                                  wineDetail.id);
                                            },
                                            child: Text(
                                              '셀러 삭제',
                                              style: TextStyle(
                                                fontSize: AppFontSizes.medium,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            style: FilledButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.secondary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                color: AppColors.secondary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              SearchService.addCellar(
                                                  wineDetail.id);
                                            },
                                            child: Text(
                                              '셀러 추가',
                                              style: TextStyle(
                                                  color: AppColors.secondary,
                                                  fontSize: AppFontSizes.medium,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              // backgroundColor: AppColors.secondary,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                color: AppColors.secondary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // #1-2 와인 주요 세부정보 끝
                  ],
                ),
              ),
              // #1 와인정보 끝

              // #2 풍미 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.maxFinite,
                height: 150,
                // 450
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '풍미',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSizes.large,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 80,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            // width ÷ height
                            valueNotifier: _acidNotifier,
                            // progress: _acid * 20,
                            progress: wineDetail.acidity * 20,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: AppColors.primary,
                            // 채울 선 색깔
                            backgroundColor: AppColors.primaryLight,
                            // 안채울 선 색깔
                            foregroundStrokeWidth: 11,
                            // 채워진 선 굵기
                            backgroundStrokeWidth: 10,
                            // 안채울 선 굵기
                            animation: true,
                            // 애니메이션 여부
                            seekSize: 0,
                            // 동그라미 크기
                            seekColor: const Color(0xffeeeeee),
                            // 동그라미 색깔
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _acidNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      wineDetail.acidity.toStringAsFixed(1),
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '산미',
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            // width ÷ height
                            valueNotifier: _bodyNotifier,
                            // progress: _body * 20,
                            progress: wineDetail.intensity * 20,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                            foregroundStrokeWidth: 11,
                            backgroundStrokeWidth: 10,
                            animation: true,
                            seekSize: 0,
                            seekColor: const Color(0xffeeeeee),
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _bodyNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      wineDetail.intensity.toStringAsFixed(1),
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '바디감',
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            valueNotifier: _sweetNotifier,
                            progress: wineDetail.sweetness * 20,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                            foregroundStrokeWidth: 11,
                            backgroundStrokeWidth: 10,
                            animation: true,
                            seekSize: 0,
                            seekColor: const Color(0xffeeeeee),
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _sweetNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      // '${_sweet}',
                                      wineDetail.sweetness.toStringAsFixed(1),
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '당도',
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            // width ÷ height
                            valueNotifier: _tanninNotifier,
                            progress: wineDetail.tannin * 20,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                            foregroundStrokeWidth: 11,
                            backgroundStrokeWidth: 10,
                            animation: true,
                            seekSize: 0,
                            seekColor: const Color(0xffeeeeee),
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _tanninNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      wineDetail.tannin.toStringAsFixed(1),
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '타닌',
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // #2 풍미 끝

              // #3 아로마 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                    // color: Colors.green,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        '아로마',
                        style: TextStyle(
                          fontSize: AppFontSizes.large,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          wineDetail.tastes.length,
                          (index) => Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: WineFlavour(
                              flavour: Flavour(
                                  id: 0, taste: wineDetail.tastes[index].name),
                              isSelected: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // #3 아로마 끝

              // #4 다른와인추천 시작
              Container(
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                    // color: Colors.blue,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        '🍷 보고 계신 것과 비슷한 와인이에요',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: AppFontSizes.large
                        ),
                      ),
                    ),
                    SearchCarouselWidget(context,
                        recommendType: 'wine-detail'),
                    // RecommendWineCardWidget(context,
                    //     recommendType: 'view'), // 가로스크롤 와인추천카드 위젯
                  ],
                ),
              ),
              // #4 다른와인추천 끝

              // #5 와인 기타 세부정보 시작
              Container(
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.red,
                    // color: Colors.black12,
                    // color: Colors.purple,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text(
                        '세부정보',
                        style: TextStyle(
                          fontSize: AppFontSizes.large,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/alcohol_content.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 30),
                              Text(
                                '${wineDetail.abv}%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSizes.mediumLarge,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/grapes.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 30),
                              Text(
                                wineDetail.grape,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSizes.mediumLarge,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/region.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 30),
                              Text(
                                wineDetail.country,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSizes.mediumLarge,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // #5 와인 기타 세부정보 끝

              // #6 테이스팅노트 작성 버튼 시작
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                width: double.maxFinite,
                // height: 100,
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    ),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: 해당 와인 객체정보 가지고 NoteColorScreen 페이지로 라우팅
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteScreen(),
                      ),
                    );
                  },
                  child: Container(
                    // padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            color: AppColors.white,
                          ),
                          Text(
                            '테이스팅노트 작성하기',
                            style: TextStyle(
                              fontSize: AppFontSizes.medium,
                              color: AppColors.white,
                            ),
                          ),
                        ]),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                  ),
                ),
              ),
              // #6 테이스팅노트 작성 버튼 끝
            ],
          ),
        );
      }),
    );
  }
}

Widget SearchDetailSkeleton(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: [
        // 스켈레톤 와인 이미지
        Container(
          width: double.infinity,
          height: 300,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // 스켈레톤 주요 정보
        Container(
          width: 200,
          height: 30,
          margin: const EdgeInsets.all(10),
          color: Colors.grey[200],
        ),
        Container(
          width: 150,
          height: 20,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.grey[200],
        ),
        Container(
          width: 100,
          height: 20,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.grey[200],
        ),
        Container(
          width: 80,
          height: 20,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.grey[200],
        ),
        Container(
          width: 300,
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.grey[200],
        ),
        Container(
          width: 300,
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.grey[200],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 40,
              margin: const EdgeInsets.all(10),
              color: Colors.grey[200],
            ),
            Container(),
          ],
        ),
        // 스켈레톤 별점 및 맛 지표
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
            );
          }),
        ),
      ],
    ),
  );
}
