import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';
import 'package:frontend/widgets/note/note_taste_widget.dart';


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
      body: SingleChildScrollView(
        child: NoteTaste(acidity: 3.5, alcohol: 2.0, tannin: 3.5,sweetness: 2.5, intensity: 4.0,),
      ),
    );
  }
}
