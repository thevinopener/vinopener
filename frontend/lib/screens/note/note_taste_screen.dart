import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_opinion_screen.dart';

class NoteTasteScreen extends StatelessWidget {
  const NoteTasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteOpinionScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Taste'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: navigateNext,
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(child: Text('note tate')),
    );
  }
}
