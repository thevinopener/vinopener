import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_search_screen.dart';

import 'package:frontend/widgets/note/note_list_card_widget.dart';


import '../../constants/fonts.dart';
import '../../models/note_model.dart';

class NoteListScreen extends StatelessWidget {

  final Note note = Note.dummy();
  final  List<Note> notes = List.generate(10, (index) => Note.dummy());

  @override
  Widget build(BuildContext context) {
    void addNote() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          //추후 SearchTextScreen()로 변경
          builder: (context) =>NoteSearchScreen(),
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
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),  // 좌우 패딩을 추가하여 카드 중앙 정렬
            child: NoteCard(note: notes[index]),
          );
        },
      ),
    );
  }
}
