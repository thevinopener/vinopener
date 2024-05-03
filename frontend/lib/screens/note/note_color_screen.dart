import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';

import '../../models/wine_model.dart';
import '../../widgets/note/note_select_color_widgit.dart';
import '../../widgets/note/note_wine_card.dart';

class NoteColorScreen extends StatelessWidget {
  const NoteColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Wine wine = Wine.dummy();

    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteSmellScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Color'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: navigateNext,
            icon: Icon(Icons.navigate_next),
          )
        ],
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
                Text('색상', style: TextStyle(fontSize: AppFontSizes.large),),
                Text('와인의 색상을 선택해 주세요', style: TextStyle(fontSize: AppFontSizes.mediumSmall),),
                SizedBox(height: 30,),
                NoteColor(),
              ],
            ),
          ),
      ),
    );
  }
}
