// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:frontend/widgets/recommend/recommend_wine_card_widget.dart';

class SearchDetailScreen extends StatefulWidget {
  @override
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '세부정보',
        style: TextStyle(
          color: Colors.black,
        ),
      )),
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
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.red,
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
                          width: double.maxFinite, // 이미지 컨테이너의 크기 조정 부분
                          height: 400,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                            borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                            // border: Border.all(
                            //   color: Colors.grey, // 테두리 색상
                            //   width: 1, // 테두리 두께
                            // ),
                          ),
                          child: Image.asset(
                            'assets/images/dummy_wine.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Image.asset(
                            'assets/images/ea.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Positioned(
                          top: 70, // 이미지 하단에서부터의 위치
                          right: 20,
                          child: Container(
                            alignment: Alignment
                                .center, // Container 내부에서 중앙 정렬이 필요하면 사용
                            padding:
                            EdgeInsets.symmetric(horizontal: 10.0), // 좌우 패딩
                            height: 40, // 텍스트 컨테이너의 세로 크기
                            width: 40,
                            decoration: BoxDecoration(
                              color: WineButtonColors.red,
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
                            '롬바흐, 시그니처 엑스트라 브뤼 프리미에 크뤼 블랑 드 누아',
                            // 'testtest',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumLarge,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: true, // 감싸주는 애
                          ),
                          Text(
                            '와이너리명',
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
                            '빈티지',
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
                                ' 4.6',
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                          color: AppColors.primary, width: 2),
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
                                        borderRadius: BorderRadius.circular(10),
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
                height: 200, // 450
                decoration: BoxDecoration(
                    color: Colors.grey,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '풍미',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSizes.mediumLarge,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularStepProgressIndicator(
                                  totalSteps: 50, // 전체 step 수
                                  currentStep: 35, // 선택할 step 수
                                  stepSize: 5, // 안채워진 부분 굵기
                                  selectedStepSize: 10, // 채워진부분 굵기
                                  unselectedColor:
                                      AppColors.primaryLight, // 안채워진 부분 색깔
                                  selectedColor: AppColors.primary, // 채워진 부분 색깔
                                  padding: 0, // 뭔가 시작점 같은데 건들 ㄴ
                                  width: 70, // 동그란 그래프 가로폭
                                  height: 70, // 동그란 그래프 세로폭
                                  roundedCap: (_, __) => true,
                                ),
                                Text(
                                  '3.5',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppFontSizes.large,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '산미',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontSizes.medium,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularStepProgressIndicator(
                                  totalSteps: 50, // 전체 step 수
                                  currentStep: 27, // 선택할 step 수
                                  stepSize: 5, // 안채워진 부분 굵기
                                  selectedStepSize: 10, // 채워진부분 굵기
                                  unselectedColor:
                                      AppColors.primaryLight, // 안채워진 부분 색깔
                                  selectedColor: AppColors.primary, // 채워진 부분 색깔
                                  padding: 0, // 뭔가 시작점 같은데 건들 ㄴ
                                  width: 70, // 동그란 그래프 가로폭
                                  height: 70, // 동그란 그래프 세로폭
                                  roundedCap: (_, __) => true,
                                ),
                                Text(
                                  '2.7',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppFontSizes.large,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '바디감',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontSizes.medium,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularStepProgressIndicator(
                                  totalSteps: 50, // 전체 step 수
                                  currentStep: 16, // 선택할 step 수
                                  stepSize: 5, // 안채워진 부분 굵기
                                  selectedStepSize: 10, // 채워진부분 굵기
                                  unselectedColor:
                                      AppColors.primaryLight, // 안채워진 부분 색깔
                                  selectedColor: AppColors.primary, // 채워진 부분 색깔
                                  padding: 0, // 뭔가 시작점 같은데 건들 ㄴ
                                  width: 70, // 동그란 그래프 가로폭
                                  height: 70, // 동그란 그래프 세로폭
                                  roundedCap: (_, __) => true,
                                ),
                                Text(
                                  '1.6',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppFontSizes.large,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '당도',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontSizes.medium,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularStepProgressIndicator(
                                  totalSteps: 50, // 전체 step 수
                                  currentStep: 45, // 선택할 step 수
                                  stepSize: 5, // 안채워진 부분 굵기
                                  selectedStepSize: 10, // 채워진부분 굵기
                                  unselectedColor:
                                      AppColors.primaryLight, // 안채워진 부분 색깔
                                  selectedColor: AppColors.primary, // 채워진 부분 색깔
                                  padding: 0, // 뭔가 시작점 같은데 건들 ㄴ
                                  width: 70, // 동그란 그래프 가로폭
                                  height: 70, // 동그란 그래프 세로폭
                                  roundedCap: (_, __) => true,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppFontSizes.large,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '타닌',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontSizes.medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // #2 풍미 끝

              // #3 아로마 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    Text('아로마'),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Row(
                        // TODO: 여기에 아로마 노트들
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
                  color: Colors.blue,
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
                    RecommendWineCardWidget(context),  // 가로스크롤 와인추천카드 위젯
                  ],
                ),
              ),
              // #4 다른와인추천 끝

              // #5 와인 기타 세부정보 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Column(
                  children: [
                    // TODO: 여기에 기타세부정보들
                  ],
                ),
              ),
              // #5 와인 기타 세부정보 끝

              // #6 테이스팅노트 작성 버튼 시작
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                // height: 100,
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    ),
                child: ElevatedButton(
                  onPressed: () {},
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
                            '  테이스팅노트 작성하기',
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
        ),
      ),
    );
  }
}
