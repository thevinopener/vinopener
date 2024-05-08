

import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/note/note_write_opinion_widget.dart';



import '../../models/wine_model.dart';

import '../../widgets/note/note_wine_card_widget.dart';

class NoteOpinionScreen extends StatelessWidget {
  const NoteOpinionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Wine wine = Wine.dummy();

    void postNote() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text('의견', style: TextStyle(fontSize: AppFontSizes.large),),
              SizedBox(height: 10,),
              Text('자유롭게 의견을 적어보세요!', style: TextStyle(fontSize: AppFontSizes.mediumSmall),),
              SizedBox(height: 30,),
              NoteOpinion(wineRate: wine.rating ?? 3.0),
              SizedBox(height: 20,),
              TextButton(
                onPressed: postNote,
                child: Text("제출", style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary, // 버튼 배경 색상
                  padding: EdgeInsets.symmetric(horizontal: 30), // 내부 여백
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
