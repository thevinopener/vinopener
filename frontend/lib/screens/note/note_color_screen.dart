import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import '../../widgets/note/note_select_color_widget.dart';

class NoteColorScreen extends StatelessWidget {
  final PageController controller;

  const NoteColorScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('색상', style: TextStyle(fontSize: AppFontSizes.large)),
            SizedBox(height: 10),
            Text('와인의 색상을 선택해 주세요', style: TextStyle(fontSize: AppFontSizes.mediumSmall)),
            SizedBox(height: 30),
            NoteColor(),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              child: Text("다음", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

