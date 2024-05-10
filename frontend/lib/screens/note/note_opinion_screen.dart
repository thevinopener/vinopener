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
      try {
        final wineId =
            Provider.of<NoteWineProvider>(context, listen: false).getWine().id;
        final noteProvider = Provider.of<NoteProvider>(context, listen: false);
        noteProvider.updateNoteProvider(wineId: wineId);

        await NoteCreateService.createNote(noteProvider);

        noteProvider.reset();
        Navigator.popUntil(context, (route) => route.isFirst);
      } catch (e) {
        print("Error posting note: $e");
        // 오류 발생 시 처리 로직 추가
      }
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text('의견', style: TextStyle(fontSize: AppFontSizes.large)),
          SizedBox(height: 10),
          Text('자유롭게 의견을 적어보세요!',
              style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
          SizedBox(height: 30),
          NoteOpinion(),
          SizedBox(height: 20),
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
    );
  }
}
