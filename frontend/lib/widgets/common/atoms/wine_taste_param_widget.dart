import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class TasteParam extends StatefulWidget {
  final String label;
  final double value;

  const TasteParam({
    required this.label,
    required this.value,
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
          Text(
            widget.label,
            style: TextStyle(fontSize: AppFontSizes.mediumSmall),
          ),
          SizedBox(
            width: 5,
          ),
          RatingBar.readOnly(
            isHalfAllowed: true,
            filledIcon: Icons.circle,
            emptyIcon: Icons.circle_outlined,
            emptyColor: Colors.grey,
            filledColor: AppColors.primary,
            halfFilledColor: AppColors.primary,
            halfFilledIcon: Icons.contrast,
            initialRating: widget.value,
            maxRating: 5,
          ),
        ],
      ),
    );
  }
}
