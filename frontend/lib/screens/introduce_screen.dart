import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/recommend/recommend_screen.dart';
import 'package:frontend/screens/survey_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../services/user_service.dart';
import 'home_screen.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "안녕하세요? 반가워요 !",
          body: "Vinopener에 대해 알아볼까요?",
          image: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/vinopener_logo.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(height: 10),
                Text(
                  'VINOPENER',
                  style: TextStyle(
                    fontSize: AppFontSizes.veryLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '관심이 취미가 되는 서비스',
                  style: TextStyle(fontSize: AppFontSizes.mediumLarge),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: "추천",
          body:
              "여러분이 좋아할만한 와인을 추천을 해드려요 !\n설문조사 기반, 셀러 기반, 조회 수 등 다양하게요.\n와인 타입별, 국가별 조회도 가능해요 !",
          image: Container(
            // color: Colors.red,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset("assets/images/recommend.gif",
                height: MediaQuery.of(context).size.height * 0.5),
          ),
        ),
        PageViewModel(
          title: "검색",
          body:
              "글자뿐만 아니라 카메라를 통한 검색도 가능해요 !\n메인화면에서 좌측으로 드래그 해보세요.\n다양한 와인을 검색하고 저장해보세요.\n음주 후, 자꾸 오타가 나진 않았나요?\nVinopener가 도와드릴게요 !",
          image: Center(
            child: Image.asset("assets/images/search.gif",
                height: MediaQuery.of(context).size.height * 0.5),
          ),
        ),
        PageViewModel(
          title: "AI 테이스팅 노트",
          body: "테이스팅 노트를 기록 할 수 있어요.\n무려 \'AI비서\'와 함께요 !\n물론 직접 작성도 가능하고요\n",
          image: Center(
            child: Image.asset("assets/images/tasting-note.gif",
                height: MediaQuery.of(context).size.height * 0.5),
          ),
        ),
        PageViewModel(
          title: "피드",
          body: "다른 사람들은 무슨 와인을 마실까요?\n궁금하지 않으신가요?\n그리고 여러분의 행복한 일상도 공유해보세요 !",
          image: Center(
            child: Image.asset("assets/images/feed.gif",
                height: MediaQuery.of(context).size.height * 0.5),
          ),
        ),
        PageViewModel(
          title: "이제 설문조사를 하러 가볼까요?",
          body: "",
          image: Container(),
        ),
      ],
      onDone: () async {
        // When done button is press
        var survey = null;
        try {
          survey = await UserService.getSurvey();
        } catch (e) {
          print(e);
        }
        bool isSurveyDone = (survey == null);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  isSurveyDone ? SurveyScreen() : HomeScreen()),
        );
      },
      onSkip: () async {
        var survey = null;
        try {
          survey = await UserService.getSurvey();
        } catch (e) {
          print(e);
        }
        bool isSurveyDone = (survey == null);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  isSurveyDone ? SurveyScreen() : HomeScreen()),
        );
      },
      showSkipButton: true,
      skip: const Text(
        '건너뛰기',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      // Icon(Icons.skip_next),
      next: const Text(
        '다음',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      // Icon(Icons.arrow_forward),
      done: const Text(
        "시작하기",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).primaryColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
