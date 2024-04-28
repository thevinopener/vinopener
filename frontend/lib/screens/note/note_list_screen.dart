import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_color_screen.dart';
import 'package:frontend/screens/survey_screen.dart';

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

    void goSurvey(){
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => SurveyScreen(),
          ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'note_list_screen.dart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          FilledButton(onPressed: addNote, child: Text('Add Note')),
          const Center(
            child: Text(
              'temp_survey',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          FilledButton(onPressed: goSurvey, child: Text('survey')),
        ],
      ),
    );
  }
}
