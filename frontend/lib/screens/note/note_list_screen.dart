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

  void viewDetail(int id) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => NoteResultScreen(id: id),
      ),
    );
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => NoteSearchScreen()),
              );
              _loadData(); // 노트 추가 후 화면으로 돌아왔을 때 데이터 새로고침
            },
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: FutureBuilder<List<WineNoteCard>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final notes = snapshot.data!;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // 각 아이템에 추가 패딩
                  child: GestureDetector(
                    onTap: () => viewDetail(notes[index].id),
                    child: NoteCard(wineNoteCard: notes[index]), // 아이템 카드
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No notes available'));
          }
        },
      ),
    );
  }
}
