import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_search_screen.dart';
import 'package:frontend/services/note_service.dart';

import '../../constants/fonts.dart';
import '../../models/note_model.dart';
import '../../widgets/note/note_list_card_widget.dart';
import 'note_result_screen.dart';


class NoteListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void addNote() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteSearchScreen(),
        ),
      );
    }

    void viewDetail(int id) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteResultScreen(id: id),
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
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: FutureBuilder<List<WineNoteCard>>(
        future: NoteListService.getNoteList(), // 비동기 함수 호출
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final notes = snapshot.data!;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () => viewDetail(notes[index].id),
                    child: NoteCard(wineNoteCard: notes[index]),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No notes available'));
          }
        },
      ),
    );
  }
}
