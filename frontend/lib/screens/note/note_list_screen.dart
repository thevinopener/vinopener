import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_search_screen.dart';
import 'package:frontend/services/note_service.dart';

import '../../constants/fonts.dart';
import '../../models/note_model.dart';
import '../../widgets/note/note_list_card_widget.dart';
import 'note_result_screen.dart';


class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  Future<List<WineNoteCard>>? _notesFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _notesFuture = NoteListService.getNoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasting Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => NoteSearchScreen()),
              );
              _loadData();  // 노트 추가 후 화면으로 돌아왔을 때 데이터 새로고침
            },
          )
        ],
      ),
      body: FutureBuilder<List<WineNoteCard>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => NoteCard(wineNoteCard: snapshot.data![index]),
            );
          } else {
            return Text('No notes available');
          }
        },
      ),
    );
  }
}

