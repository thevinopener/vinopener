import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';
import 'package:frontend/widgets/common/atoms/wine_color_widget.dart';

import '../../constants/colors.dart';

class NoteColorScreen extends StatelessWidget {
  const NoteColorScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
        title: Text('Note Color'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: navigateNext,
            icon: Icon(Icons.navigate_next),
          )
        ],
      ),
      body: WineColor(wineColor: WineColors.wineColorMap["밑집색"]!, colorName: "밑집색",)
    );
  }
}
