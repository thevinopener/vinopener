import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class SurveySlider extends StatefulWidget {
  final Function(double) onChanged;  // 새로운 콜백 정의

  const SurveySlider({Key? key, required this.onChanged}) : super(key: key); // 생성자에 onChanged 추가

  @override
  State<SurveySlider> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SurveySlider> {
  double _currentSliderValue = 50;

  String? alcohol(int number) {
    if (number <= 0) {
      return '없음';
    } else if (number <= 25) {
      return '조금 적게';
    } else if (number <= 50) {
      return '중간';
    } else if (number <= 75) {
      return '조금 많이';
    } else {
      return '많이';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          trackHeight: 8.0,
          valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          valueIndicatorColor: AppColors.primary, // 값 지시자 배경 색상
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white, // 값 지시자 텍스트 색상
            fontSize: AppFontSizes.small, // 값 지시자 텍스트 크기
          ),
        ),
        child: Slider(
          activeColor: AppColors.primary,
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 4,
          label: alcohol(_currentSliderValue.toInt()),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            widget.onChanged(value);  // 콜백 함수 호출
          },
        ),
      ),
    );
  }
}
