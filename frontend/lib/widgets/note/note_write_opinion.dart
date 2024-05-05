import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class NoteOpinion extends StatefulWidget {
  final double? wineRate; // nullable로 변경
  const NoteOpinion({Key? key, this.wineRate})
      : super(key: key); // 기본값을 null로 허용

  @override
  State<NoteOpinion> createState() => _NoteOpinionState();
}

class _NoteOpinionState extends State<NoteOpinion> {
  late double wineRate;
  TextEditingController opinionController =
      TextEditingController(); // 컨트롤러를 여기서 바로 초기화

  @override
  void initState() {
    super.initState();
    wineRate = widget.wineRate ?? 3.0; // null이면 기본값 3.0 사용

    // TextField의 변화 감지를 위한 리스너 추가
    opinionController.addListener(() {
      // 텍스트와 별점을 함께 출력
      print(
          'Opinion: ${opinionController.text}, Current Rating: ${wineRate.toStringAsFixed(1)}');
    });
  }

  @override
  void dispose() {
    opinionController.dispose(); // 컨트롤러 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        children: [
          TextField(
            controller: opinionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '자유롭게 의견을 적어보세요!',
            ),
            maxLines: 12, // 높이를 높이기 위해 여러 줄로 설정
            style: TextStyle(fontSize: 16), // 텍스트 크기 조정
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(wineRate.toStringAsFixed(1),
                  style: TextStyle(
                      fontSize: AppFontSizes.large,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              RatingBar(
                initialRating: wineRate,
                isHalfAllowed: true,
                onRatingChanged: (value) {
                  setState(() {
                    wineRate = value; // 상태 업데이트
                    // 텍스트와 별점을 함께 출력
                    print(
                        'Opinion: ${opinionController.text}, Current Rating: ${wineRate.toStringAsFixed(1)}');
                  });
                },
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                emptyColor: Colors.grey,
                filledColor: AppColors.primary,
                halfFilledColor: AppColors.primary,
                halfFilledIcon: Icons.star_half,
                maxRating: 5,
              )
            ],
          )
        ],
      ),
    );
  }
}
