import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class SurveyRangeSlider extends StatefulWidget {
  final Function(RangeValues) onRangeSelected; // 상위 위젯에서 범위 변경을 처리할 수 있도록 콜백 추가

  const SurveyRangeSlider({Key? key, required this.onRangeSelected}) : super(key: key);

  @override
  State<SurveyRangeSlider> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SurveyRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(25, 75);

  String alcohol(double value) {
    int intValue = value.toInt();
    switch (intValue) {
      case 0:
        return '물';
      case 25:
        return '맥주';
      case 50:
        return '막걸리';
      case 75:
        return '소주';
      case 100:
        return '양주';
      default:
        return ''; // 모든 케이스를 처리하지 않을 때 기본적으로 빈 문자열 반환
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 8.0,
          rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 10.0),
          valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          valueIndicatorColor: AppColors.primary,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
            fontSize: AppFontSizes.small,
          ),
        ),
        child: RangeSlider(
          activeColor: AppColors.primary,
          values: _currentRangeValues,
          min: 0,
          max: 100,
          divisions: 4,
          labels: RangeLabels(
            alcohol(_currentRangeValues.start),
            alcohol(_currentRangeValues.end),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
            widget.onRangeSelected(values); // 상위 위젯에 변경사항 전달
          },
        ),
      ),
    );
  }
}
