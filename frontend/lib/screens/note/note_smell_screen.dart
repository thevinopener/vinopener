import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_taste_screen.dart';

class NoteSmellScreen extends StatelessWidget {
  const NoteSmellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteTasteScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Smell'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: navigateNext,
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(child: Text('note smell')),
    );
  }
}
