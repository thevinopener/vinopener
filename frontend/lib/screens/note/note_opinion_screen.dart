

import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/note/note_write_opinion.dart';



import '../../models/wine_model.dart';

import '../../widgets/note/note_wine_card.dart';

class NoteOpinionScreen extends StatelessWidget {
  const NoteOpinionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Wine wine = Wine.dummy();

    void postNote() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Opinion'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: NoteWineCard(wine: wine),
              ),

              SizedBox(height: 20,),
              Text('의견', style: TextStyle(fontSize: AppFontSizes.large),),
              SizedBox(height: 10,),
              Text('자유롭게 의견을 적어보세요!', style: TextStyle(fontSize: AppFontSizes.mediumSmall),),
              SizedBox(height: 30,),
              NoteOpinion(wineRate: wine.rating ?? 3.0),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          height: 40,
          width: double.infinity, // 버튼을 컨테이너 전체 너비로 확장
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [], // 그림자 제거
          ),
          child: TextButton(
            onPressed: postNote,
            child: Text("제출", style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary, // 버튼 배경 색상
              padding: EdgeInsets.symmetric(horizontal: 30), // 내부 여백
            ),
          ),
        ),
      ],
    );
  }
}
