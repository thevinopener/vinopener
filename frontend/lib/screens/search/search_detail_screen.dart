// flutter
import 'package:flutter/material.dart';
import 'package:frontend/providers/search/search_wine_detail_provider.dart';

// package
import 'package:provider/provider.dart';

// constant
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

// pages & widgets & models
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_flavour_widget.dart';
import 'package:frontend/models/note_model.dart';

// library
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

import '../note/note_screen.dart';

const Map<String, Color> wineTypeColors = {
  'red': WineButtonColors.red,
  'white': WineButtonColors.rose,
  'rose': WineButtonColors.white,
  'sparkling': WineButtonColors.sparkling,
};

// TODO: 즐겨찾기 추가/삭제, 셀러 추가/삭제, 테이스팅 노트 라우팅, 와인 추천 API 연결, 배경색 흰색 변경, AppBar 디테일 수정, 테이스팅 노트 작성 횟수 및 뱃지 CSS 추가

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
      final searchWineDetailProvider = Provider.of<SearchWineDetailProvider>(context, listen: false);
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
      body:

      // Container(
      //   color: Colors.white,
      //   child:

      Consumer<SearchWineDetailProvider>(
        builder: (context, wineDetailProvider, child) {
          // 로딩 중인 경우 로딩 화면 표시
          if (wineDetailProvider.isLoading) {
            return Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                          child: const CircularProgressIndicator(
                            color: AppColors.primary, // 예시로 색상 변경
                            strokeWidth: 8,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 335,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // ),
            );
          }

          // 와인 상세 정보가 없는 경우 예외 처리
          final wineDetail = wineDetailProvider.wineDetail;
          if (wineDetail == null) {
            return const Center(child: Text('와인 정보를 불러올 수 없습니다.'));
          }

          // 와인 정보가 있는 경우 화면에 표시
          return
            SingleChildScrollView(
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
                                color:
                                Colors.white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                                borderRadius: BorderRadius.circular(
                                    5), // 모서리 둥글게
                                // border: Border.all(
                                //   color: Colors.grey, // 테두리 색상
                                //   width: 1, // 테두리 두께
                                // ),
                              ),
                              child:
                              Image.network(wineDetail.imageUrl,
                                fit: BoxFit.fitHeight,),
                              // Image.asset(
                              //   'assets/images/dummy_wine.png',
                              //   fit: BoxFit.fitHeight,
                              // ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: NationFlag(country: wineDetail.country,
                                  height: 40,
                                  width: 40),
                              // Image.asset(
                              //   'assets/images/ea.png',
                              //   width: 40,
                              //   height: 40,
                              // ),
                            ),
                            Positioned(
                              top: 70, // 이미지 하단에서부터의 위치
                              right: 20,
                              child: Container(
                                alignment: Alignment
                                    .center,
                                // Container 내부에서 중앙 정렬이 필요하면 사용
                                padding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                                // 좌우 패딩
                                height: 40,
                                // 텍스트 컨테이너의 세로 크기
                                width: 40,
                                decoration: BoxDecoration(
                                  color: wineTypeColors[wineDetail.type
                                      .toLowerCase()] ?? Colors.white,
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
                                // '프릿츠 하크 브라우네베르거 유퍼 존넨누어 리슬링 트로켄베어렌아우스레제', // 세상에서 가장 긴 와인이름
                                // '와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명', // 여기 안넘으면 안터짐 ㄱㅊ
                                // '롬바흐, 시그니처 엑스트라 브뤼 프리미에 크뤼 블랑 드 누아',
                                // 'testtest',
                                wineDetail.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumLarge,
                                  fontWeight: FontWeight.w500,
                                ),
                                softWrap: true, // 감싸주는 애
                              ),
                              Text(
                                // '와이너리명',
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
                                  fontWeight: FontWeight.w500,
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
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // TODO: API 붙일 때, boolean 여부로 버튼 변경 추가 필요
                                    Container(
                                      width: double.maxFinite,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          '즐겨찾기 추가',
                                          style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: AppFontSizes.medium,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                          ),
                                          side: BorderSide(
                                              color: AppColors.primary,
                                              width: 2),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          '셀러 추가',
                                          style: TextStyle(
                                              color: AppColors.secondary,
                                              fontSize: AppFontSizes.medium,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          // backgroundColor: AppColors.secondary,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                          ),
                                          side: BorderSide(
                                            color: AppColors.secondary,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontSizes.large,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 80,
                              // decoration: const BoxDecoration(
                              //   gradient: LinearGradient(
                              //     begin: Alignment.topLeft,
                              //     end: Alignment.bottomRight,
                              //     colors: [
                              //       AppColors.primary,
                              //       AppColors.secondary,
                              //     ],
                              //   ),
                              // ),
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
                                    builder: (_, double value, __) =>
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              // '${value.toInt()}',
                                              // '${_acid}',,
                                              wineDetail.acidity.toStringAsFixed(1),
                                              style: const TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '산미',
                                              style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500,
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
                                    valueListenable: _bodyNotifier,
                                    builder: (_, double value, __) =>
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              // '${value.toInt()}',
                                              // '${_body}',
                                              wineDetail.intensity.toStringAsFixed(1),
                                              style: const TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '바디감',
                                              style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500,
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
                                valueNotifier: _sweetNotifier,
                                // progress: _sweet * 20,
                                progress: wineDetail.sweetness * 20,
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
                                    valueListenable: _sweetNotifier,
                                    builder: (_, double value, __) =>
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              // '${_sweet}',
                                              wineDetail.sweetness.toStringAsFixed(1),
                                              style: const TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '당도',
                                              style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500,
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
                                    valueListenable: _tanninNotifier,
                                    builder: (_, double value, __) =>
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              // '${_tannin}',
                                              wineDetail.tannin.toStringAsFixed(1),
                                              style: const TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '타닌',
                                              style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w500,
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
                              fontWeight: FontWeight.w500,
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
                                  (index) =>
                                  Padding(
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
                      // color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            '이런 와인은 어떠세요?',
                            style: TextStyle(
                              fontSize: AppFontSizes.large,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        RecommendWineCardWidget(context), // 가로스크롤 와인추천카드 위젯
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
                              fontWeight: FontWeight.w500,
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
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                      fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
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

          // =======
          // ),
          // ========

        }
    ),
    );
  }
}
