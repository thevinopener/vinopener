import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../constants/fonts.dart';
import '../../models/note_model.dart';

class NoteResultScreen extends StatelessWidget {

  final Note note = Note.dummy();
  final  List<Note> notes = List.generate(10, (index) => Note.dummy());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Tasting Note',
            style: TextStyle(
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: Border(bottom: BorderSide(color: Colors.grey))),
      body: Container(

      )
    );
  }
}
