import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_color_screen.dart';


import '../../constants/fonts.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void addNote() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteColorScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Tasting Note',
            style: TextStyle(
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: addNote,
              icon: Icon(Icons.add),
            )
          ],
          shape: Border(bottom: BorderSide(color: Colors.grey))),
      body: Column(children: []),
    );
  }
}
