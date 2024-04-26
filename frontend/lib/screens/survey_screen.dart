import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/survey/survey_select_widget.dart';
import 'package:frontend/widgets/survey/survey_range_slider_widget.dart';
import 'package:frontend/widgets/survey/survey_slider_widget.dart';
import 'home_screen.dart'; // 홈 화면을 import

class SurveyScreen extends StatelessWidget {
  Set<String> wind_Kind = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Survey")),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      '당신의 취향은?',
                      style: TextStyle(
                          fontSize: AppFontSizes.veryLarge,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            '종류',
                            style: TextStyle(fontSize: AppFontSizes.large),
                          )
                        ],
                      ),
                      SelectKindButton(),
                      Row(
                        children: [
                          Text('도수',
                              style: TextStyle(fontSize: AppFontSizes.large))
                        ],
                      ),
                      SurveyRangeSlider(),
                      Row(
                        children: [
                          Text('당도',
                              style: TextStyle(fontSize: AppFontSizes.large))
                        ],
                      ),
                      SurveySlider(),
                      Row(
                        children: [
                          Text('산도',
                              style: TextStyle(fontSize: AppFontSizes.large))
                        ],
                      ),
                      SurveySlider(),
                      Row(
                        children: [
                          Text('타닌',
                              style: TextStyle(fontSize: AppFontSizes.large))
                        ],
                      ),
                      SurveySlider(),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ElevatedButton(
                  child: Text(
                    "제출",
                    style: TextStyle(fontSize: AppFontSizes.mediumSmall),
                  ),
                  onPressed: () {
                    // 설문조사 화면에서 홈 화면으로 이동하며 스택을 초기화
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ))));
  }
}
