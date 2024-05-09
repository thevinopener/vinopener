import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/note/note_opinion_screen.dart';
import 'package:frontend/widgets/note/note_taste_widget.dart';

import '../../models/wine_model.dart';

import '../../widgets/note/note_wine_card_widget.dart';

class NoteTasteScreen extends StatelessWidget {
  final PageController controller;
  const NoteTasteScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Wine wine = Wine.dummy();

    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteOpinionScreen(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '맛',
              style: TextStyle(fontSize: AppFontSizes.large),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '어떤 맛이 났나요?',
              style: TextStyle(fontSize: AppFontSizes.mediumSmall),
            ),
            SizedBox(
              height: 30,
            ),
            NoteTaste(),
            SizedBox(
              height: 20,
            ),
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
