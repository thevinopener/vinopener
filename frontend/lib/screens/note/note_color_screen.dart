import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';


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

      ),
    );
  }
}
