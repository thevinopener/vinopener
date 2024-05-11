
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class TasteParam extends StatefulWidget {
  final String label;
  final double value;
  final bool readOnly;

  const TasteParam({
    required this.label,
    required this.value,
    this.readOnly = false,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: AppFontSizes.mediumSmall),
          ),
          SizedBox(
            width: 5,
          ),
          RatingBar(
            itemSize: 35,
            initialRating: widget.value,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            ratingWidget: RatingWidget(
              full: Icon(Icons.circle, color: AppColors.primary,),
              half: Icon(Icons.contrast, color: AppColors.primary,),
              empty: Icon(Icons.circle_outlined, color: Colors.grey,),
            ),
            onRatingUpdate: (rating) {
              // 이 콜백 함수는 실제로는 아무것도 하지 않지만 readOnly와 같은 동작을 구현할 수 있습니다.
            },
            updateOnDrag: false, // Drag를 통한 업데이트 비활성화
            ignoreGestures: widget.readOnly,
          )
        ],
      ),
    );
  }
}
