import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

class SurveySlider extends StatefulWidget {
  const SurveySlider({super.key});

  @override
  State<SurveySlider> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SurveySlider> {
  double _currentSliderValue = 0;

  String? alcohol(int number) {
    switch (number) {
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
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
        child: Slider(
          activeColor: AppColors.primary,
          value: _currentSliderValue,
          max: 100,
          divisions: 4,
          label: alcohol(_currentSliderValue.toInt()),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ),
    );
  }
}
