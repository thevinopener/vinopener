import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:frontend/constants/colors.dart';

import '../../constants/fonts.dart';

class NoteTaste extends StatefulWidget {
  final double sweetness;
  final double intensity;
  final double acidity;
  final double alcohol;
  final double tannin;

  const NoteTaste({
    required this.acidity,
    required this.alcohol,
    required this.tannin,
    required this.sweetness,
    required this.intensity,
    Key? key,
  }) : super(key: key);

  @override
  State<NoteTaste> createState() => _NoteTasteState();
}

class _NoteTasteState extends State<NoteTaste> {
  late double sweetness;
  late double intensity;
  late double acidity;
  late double alcohol;
  late double tannin;

  @override
  void initState() {
    super.initState();
    sweetness = widget.sweetness;
    intensity = widget.intensity;
    acidity = widget.acidity;
    alcohol = widget.alcohol;
    tannin = widget.tannin;
  }

  List<List<double>> getChartData() {
    return [[intensity, alcohol, tannin, acidity, sweetness]];
  }

  void updateAndPrintValues() {
    print('Sweetness: $sweetness, Intensity: $intensity, Acidity: $acidity, Alcohol: $alcohol, Tannin: $tannin');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: RadarChart(
              ticks: [1, 2, 3, 4, 5],
              features: ["바디", "알코올", "타닌", "산도", "당도"],
              data: getChartData(),
              graphColors: [
                AppColors.primary,
              ],
              axisColor: AppColors.black,
              outlineColor: AppColors.black,
              featuresTextStyle: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              reverseAxis: false,
              sides: 5,
            ),
          ),
          _buildRatingBar("당도", sweetness, (rating) {
            setState(() {
              sweetness = rating;
              updateAndPrintValues();
            });
          }),
          _buildRatingBar("산도", acidity, (rating) {
            setState(() {
              acidity = rating;
              updateAndPrintValues();
            });
          }),
          _buildRatingBar("바디", intensity, (rating) {
            setState(() {
              intensity = rating;
              updateAndPrintValues();
            });
          }),
          _buildRatingBar("알코올", alcohol, (rating) {
            setState(() {
              alcohol = rating;
              updateAndPrintValues();
            });
          }),
          _buildRatingBar("타닌", tannin, (rating) {
            setState(() {
              tannin = rating;
              updateAndPrintValues();
            });
          }),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double initialValue, void Function(double) onRatingChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label, style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
          RatingBar(
            isHalfAllowed: true,
            filledIcon: Icons.circle,
            emptyIcon: Icons.circle_outlined,
            emptyColor: Colors.grey,
            filledColor: AppColors.primary,
            halfFilledColor: AppColors.primary,
            halfFilledIcon: Icons.contrast,
            initialRating: initialValue,
            maxRating: 5,
            onRatingChanged: onRatingChange,
          ),
        ],
      ),
    );
  }
}
