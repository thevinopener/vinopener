

import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/note_service.dart';
import 'package:frontend/widgets/note/note_write_opinion_widget.dart';
import 'package:provider/provider.dart';





import '../../providers/note/note_wine_provider.dart';


class NoteOpinionScreen extends StatelessWidget {
  const NoteOpinionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future<void> postNote() async {
      // NoteProvider에서 모든 데이터를 가져와 출력
      final noteProvider = Provider.of<NoteProvider>(context, listen: false);
      noteProvider.updateNoteProvider(wineId: 1);

      NoteCreateService.createNote(noteProvider);

      // NoteProvider를 초기화
      noteProvider.reset();

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
              NoteOpinion(),
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
