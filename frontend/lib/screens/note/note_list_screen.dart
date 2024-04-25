import 'package:flutter/material.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: const Center(
        child: Text('note_list_screen.dart',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
      ),
    );
  }
}