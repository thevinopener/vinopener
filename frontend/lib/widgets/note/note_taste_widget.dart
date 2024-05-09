
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../constants/fonts.dart';
import '../../providers/note/note_wine_provider.dart';

class NoteTaste extends StatefulWidget {
  const NoteTaste({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteTaste> createState() => _NoteTasteState();
}

class _NoteTasteState extends State<NoteTaste> {
  @override
  void initState() {
    super.initState();
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
            child: Consumer<NoteProvider>(builder: (context, provider, child) {
              return RadarChart(
                ticks: [1, 2, 3, 4, 5],
                features: ["바디", "알코올", "타닌", "산도", "당도"],
                data: [
                  [
                    provider.intensity,
                    provider.alcohol,
                    provider.tannin,
                    provider.acidity,
                    provider.sweetness
                  ]
                ],
                graphColors: [AppColors.primary],
                axisColor: AppColors.black,
                outlineColor: AppColors.black,
                featuresTextStyle: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                reverseAxis: false,
                sides: 5,
              );
            }),
          ),
          _buildRatingBar("당도", Provider.of<NoteProvider>(context, listen: false).sweetness, "sweetness"),
          _buildRatingBar("산도", Provider.of<NoteProvider>(context, listen: false).acidity, "acidity"),
          _buildRatingBar("바디", Provider.of<NoteProvider>(context, listen: false).intensity, "intensity"),
          _buildRatingBar("알코올", Provider.of<NoteProvider>(context, listen: false).alcohol, "alcohol"),
          _buildRatingBar("타닌", Provider.of<NoteProvider>(context, listen: false).tannin, "tannin"),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double initialValue, String property) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label, style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
          RatingBar(
            itemSize: 35,
            initialRating: initialValue,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.circle,
                color: AppColors.primary,
              ),
              half: Icon(
                Icons.contrast,
                color: AppColors.primary,
              ),
              empty: Icon(
                Icons.circle_outlined,
                color: Colors.grey,
              ),
            ),
            onRatingUpdate: (rating) {
              var provider = Provider.of<NoteProvider>(context, listen: false);
              switch (property) {
                case "sweetness":
                  provider.updateNoteProvider(sweetness: rating);
                  break;
                case "acidity":
                  provider.updateNoteProvider(acidity: rating);
                  break;
                case "intensity":
                  provider.updateNoteProvider(intensity: rating);
                  break;
                case "alcohol":
                  provider.updateNoteProvider(alcohol: rating);
                  break;
                case "tannin":
                  provider.updateNoteProvider(tannin: rating);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
