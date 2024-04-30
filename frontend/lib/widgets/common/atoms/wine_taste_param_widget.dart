import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

class TasteParam extends StatefulWidget {
  final double sweetness;
  final double intensity;
  final double acidity;
  final double alcohol;
  final double tannin;

  const TasteParam({
    required this.acidity,
    required this.alcohol,
    required this.tannin,
    required this.sweetness,
    required this.intensity,
    Key? key,
  }) : super(key: key);

  @override
  State<TasteParam> createState() => _TasteParamState();
}

class _TasteParamState extends State<TasteParam> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RatingBar.readOnly(
            isHalfAllowed: true,
            filledIcon: Icons.circle,
            emptyIcon: Icons.circle_outlined,
            emptyColor: Colors.grey,
            filledColor: AppColors.primary,
            halfFilledColor: AppColors.primary,
            halfFilledIcon: Icons.contrast,
            initialRating: widget.sweetness,
            maxRating: 5,
          ),
        ],
      ),
    );
  }
}
