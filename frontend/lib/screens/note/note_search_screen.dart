import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'note_color_screen.dart';

class NoteSearchScreen extends StatelessWidget {
  const NoteSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NoteColorScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Container(

          ),
        )
      );
  }
}
