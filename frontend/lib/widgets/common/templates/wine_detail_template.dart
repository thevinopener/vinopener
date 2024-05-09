// flutter
import 'package:flutter/material.dart';

// constant
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

// pages & widgets & models
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_flavour_widget.dart';
import 'package:frontend/models/note_model.dart';

// library
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class WineDetailScreen extends StatefulWidget {
  final Wine wine;

  WineDetailScreen({required this.wine});

  @override
  _WineDetailScreenState createState() => _WineDetailScreenState();
}

class _WineDetailScreenState extends State<WineDetailScreen> {
  final ValueNotifier<double> _acidNotifier = ValueNotifier(0);
  final ValueNotifier<double> _bodyNotifier = ValueNotifier(0);
  final ValueNotifier<double> _sweetNotifier = ValueNotifier(0);
  final ValueNotifier<double> _tanninNotifier = ValueNotifier(0);
  late double? _acid;
  late double? _body;
  late double? _sweet;
  late double? _tannin;

  late bool isBookmarked;
  late bool isAddedToCellar;

  @override
  void initState() {
    super.initState();
    _acid = widget.wine.acidity;
    _body = widget.wine.intensity;
    _sweet = widget.wine.sweetness;
    _tannin = widget.wine.tannin;
    isBookmarked = widget.wine.isBookmarked ?? false;
    isAddedToCellar = widget.wine.isAddedToCellar ?? false;
  }

  @override
  Widget build(BuildContext context) {
    void _toggleBookmark() {
      setState(() {
        isBookmarked = !isBookmarked;
      });
    }

    void _toggleCellar() {
      setState(() {
        isAddedToCellar = !isAddedToCellar;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.navigate_before),
        ),
        title: Text(
          '세부 정보',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // #1 와인정보 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.maxFinite,
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
                          height: 300,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.network(
                            '${widget.wine.imageUrl}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: NationFlag(
                            country: '${widget.wine.country}',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Positioned(
                          top: 70,
                          right: 20,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: WineButtonColors.getColor(
                                  '${widget.wine.type}'),
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
                      child: Column(
                        children: [
                          Text(
                            '${widget.wine.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumLarge,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            '${widget.wine.winery}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.medium,
                              fontWeight: FontWeight.w300,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${widget.wine.vintage}',
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
                                '${widget.wine.rating}',
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
                                isBookmarked
                                    ? Container(
                                        width: double.maxFinite,
                                        child: FilledButton(
                                          onPressed: () {
                                            WineService
                                                .deleteWineFromBookmark();
                                            _toggleBookmark();
                                          },
                                          child: Text(
                                            '즐겨찾기 삭제',
                                            style: TextStyle(
                                              fontSize: AppFontSizes.medium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: FilledButton.styleFrom(
                                            backgroundColor: AppColors.primary,
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
                                          onPressed: () {
                                            WineService.addWineToBookmark();
                                            _toggleBookmark();
                                          },
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            side: BorderSide(
                                                color: AppColors.primary,
                                                width: 2),
                                          ),
                                        ),
                                      ),
                                isAddedToCellar
                                    ? Container(
                                        width: double.maxFinite,
                                        child: FilledButton(
                                          onPressed: () {
                                            // WineService.deleteWineFromCellar();
                                            _toggleCellar();
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
                                            // WineService.addWineToCellar();
                                            _toggleCellar();
                                          },
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
                        fontSize: AppFontSizes.medium,
                        fontWeight: FontWeight.bold,
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
                            valueNotifier: _acidNotifier,
                            progress: _acid! * 20,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                            foregroundStrokeWidth: 11,
                            backgroundStrokeWidth: 10,
                            animation: true,
                            seekSize: 0,
                            seekColor: const Color(0xffeeeeee),
                            // 동그라미 색깔
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _acidNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      // '${value.toInt()}',
                                      '${_acid}',
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
                            progress: _body! * 20,
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
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      // '${value.toInt()}',
                                      '${_body}',
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
                            progress: _sweet! * 20,
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
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${_sweet}',
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
                            progress: _tannin! * 20,
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
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${_tannin}',
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
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: widget.wine.flavours?.isEmpty ?? true
                          ? Container() // aromaList가 비어 있을 때는 빈 컨테이너를 반환합니다.
                          : Row(
                              children: List.generate(
                                widget.wine.flavours!.length,
                                (index) => Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: WineFlavour(
                                    flavour: Flavour(
                                        id: 0,
                                        taste: widget.wine.flavours![index]),
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
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.bold,
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
                width: double.maxFinite,
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text(
                        '세부정보',
                        style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.bold,
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
                                '${widget.wine.abv}%',
                                style: TextStyle(
                                  fontSize: AppFontSizes.medium,
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
                                '${widget.wine.grape}',
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumSmall,
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
                                '${widget.wine.country}, ${widget.wine.winery}',
                                style: TextStyle(
                                  fontSize: AppFontSizes.small,
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
            ],
          ),
        ),
      ),
    );
  }
}
