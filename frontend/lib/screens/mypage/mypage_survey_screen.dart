import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/user_service.dart';
import 'package:frontend/widgets/survey/survey_select_widget.dart';
import 'package:frontend/widgets/survey/survey_range_slider_widget.dart';
import 'package:frontend/widgets/survey/survey_slider_widget.dart';
import 'package:frontend/models/survey_model.dart';

class MyPageSurveyScreen extends StatefulWidget {
  MyPageSurveyScreen({Key? key}) : super(key: key);

  @override
  _MyPageSurveyScreenState createState() => _MyPageSurveyScreenState();
}

class _MyPageSurveyScreenState extends State<MyPageSurveyScreen> {
  Set<String> _selectedKinds = Set<String>();
  double _alcoholStart = 25.0;
  double _alcoholEnd = 75.0;
  int _sweetness = 50;
  int _acidity = 50;
  int _bitterness = 50;

  void loadSurvey() async {
    try {
      Survey survey = await UserService.getSurvey();
      print(survey);
      setState(() {
        _alcoholStart = survey.minAbv.toDouble();
        _alcoholEnd = survey.maxAbv.toDouble();
        int _sweetness = survey.sweetness;
        int _acidity = survey.acidity;
        int _bitterness = survey.tannin;
      });
    } catch (e) {
      print("Failed to load survey: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadSurvey();
  }

  void _updateKind(Set<String> kinds) {
    setState(() {
      _selectedKinds = kinds;
    });
  }

  void _updateAlcoholRange(RangeValues values) {
    setState(() {
      _alcoholStart = values.start;
      _alcoholEnd = values.end;
    });
  }

  void _updateSweetness(double value) {
    setState(() {
      _sweetness = value.toInt();
    });
  }

  void _updateAcidity(double value) {
    setState(() {
      _acidity = value.toInt();
    });
  }

  void _updateBitterness(double value) {
    setState(() {
      _bitterness = value.toInt();
    });
  }

  void _updateSurvey() {
    final survey = Survey(
      types: _selectedKinds,
      minAbv: _alcoholStart.toInt(),
      maxAbv: _alcoholEnd.toInt(),
      sweetness: _sweetness,
      acidity: _acidity,
      tannin: _bitterness,
    );
    UserService.updateSurvey(survey);
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "취향 설문 수정",
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.05),
      ),
      body: Container(
        color: Colors.purple.withOpacity(0.05),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '당신의 취향은?',
                  style: TextStyle(
                    fontSize: AppFontSizes.veryLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('종류',
                              style: TextStyle(fontSize: AppFontSizes.large)),
                        ),
                        SelectKindButton(onSelected: _updateKind),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('도수',
                              style: TextStyle(fontSize: AppFontSizes.large)),
                        ),
                        SurveyRangeSlider(onRangeSelected: _updateAlcoholRange),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('단맛',
                              style: TextStyle(fontSize: AppFontSizes.large)),
                        ),
                        SurveySlider(onChanged: _updateSweetness),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('신맛',
                              style: TextStyle(fontSize: AppFontSizes.large)),
                        ),
                        SurveySlider(onChanged: _updateAcidity),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('떫기',
                              style: TextStyle(fontSize: AppFontSizes.large)),
                        ),
                        SurveySlider(onChanged: _updateBitterness),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "수정",
                      style: TextStyle(
                        fontSize: AppFontSizes.mediumSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _updateSurvey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
