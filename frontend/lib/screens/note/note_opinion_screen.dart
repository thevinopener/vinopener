import 'package:flutter/material.dart';

class NoteOpinionScreen extends StatelessWidget {
  const NoteOpinionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void postNote() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Opinion'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: postNote,
            icon: Icon(Icons.bookmark_add),
          ),
        ],
      ),
      body: Center(child: Text('note tate')),
    );
  }
}
