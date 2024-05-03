import 'package:flutter/cupertino.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:frontend/constants/colors.dart';


class TasteChart extends StatefulWidget {
  final double sweetness;
  final double intensity;
  final double acidity;
  final double alcohol;
  final double tannin;

  const TasteChart({
    required this.acidity,
    required this.alcohol,
    required this.tannin,
    required this.sweetness,
    required this.intensity,
    Key? key,
  }) : super(key: key);

  @override
  State<TasteChart> createState() => _TasteChartState();
}

class _TasteChartState extends State<TasteChart> {
  var ticks = [1, 2, 3, 4, 5];
  var features = ["바디", "알코올", "타닌", "산도", "당도"];

  late List<List<double>> data;

  @override
  void initState() {
    super.initState();
    data = [
      [
        widget.intensity, // 바디
        widget.alcohol,   // 알코올
        widget.tannin,    // 타닌
        widget.acidity,   // 산도
        widget.sweetness, // 당도
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadarChart(
        ticks: ticks,
        features: features,
        data: data,
        graphColors: [AppColors.primary,],
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
    );
  }
}
