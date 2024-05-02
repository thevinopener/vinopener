// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class SearchDetailScreen extends StatefulWidget {
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
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 400,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    ),

                // #1-1 와인이미지, 국기 시작
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.maxFinite, // 이미지 컨테이너의 크기 조정 부분
                            height: double.maxFinite,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // 얘랑 위에 이미지 배경색이랑 겹치면 중복설정이라 에러남
                              borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                              // border: Border.all(
                              //   color: Colors.grey, // 테두리 색상
                              //   width: 1, // 테두리 두께
                              // ),
                            ),
                            child: Image.asset(
                              'assets/images/dummy_wine.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Image.asset(
                              'assets/images/ea.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // #1-1 와인이미지, 국기 끝

                    // #1-2 와인 주요 세부정보 시작
                    Flexible(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        decoration: BoxDecoration(
                          // color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // 와인타입
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: WineButtonColors.red,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Red',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppFontSizes.medium,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // '프릿츠 하크 브라우네베르거 유퍼 존넨누어 리슬링 트로켄베어렌아우스레제', // 세상에서 가장 긴 와인이름
                                    // '와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명와인명', // 여기 안넘으면 안터짐 ㄱㅊ
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
                                    overflow: TextOverflow
                                        .ellipsis, // 글자수 넘치면 ... 으로 바꿔주는애
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                '빈티지',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumLarge,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
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
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                '\$ 508.88',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppFontSizes.large,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              child: Container(
                                height: 300,
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
                                            color: AppColors.primary,
                                            width: 2
                                          ),
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
                            )
                          ],
                        ),
                      ),
                    ),
                    // #1-2 와인 주요 세부정보 끝
                  ],
                ),
              ),
              // #1 와인정보 끝

              // #2 풍미 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(),
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
                child: Column(),
              ),
              // #3 아로마 끝

              // #4 다른와인추천 시작
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(),
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
                child: Column(),
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
