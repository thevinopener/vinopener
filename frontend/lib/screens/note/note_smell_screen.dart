import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/widgets/note/note_select_flavour_widget.dart';

class NoteSmellScreen extends StatelessWidget {
  final PageController controller;

  const NoteSmellScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '향기',
              style: TextStyle(fontSize: AppFontSizes.large),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '어떠한 향기가 나나요?',
              style: TextStyle(fontSize: AppFontSizes.mediumSmall),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: -2,
                  )
                ],
              ),
              child: NoteFlavour(),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
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
