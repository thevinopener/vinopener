import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/note/note_search_screen.dart';
import 'package:frontend/services/note_service.dart';
import 'package:shimmer/shimmer.dart';

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
      _notesFuture = NoteService.getNoteList();
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
        backgroundColor: Colors.white.withOpacity(0.1),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/vinopener_logo.png',
              height: 45, // 이미지 크기 조절
              width: 45, // 이미지 크기 조절
            ),
            SizedBox(width: 8), // 이미지와 텍스트 사이의 간격
            Text(
              'Tasting Note',
              style: TextStyle(
                fontSize: AppFontSizes.mediumLarge,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        leadingWidth: double.maxFinite,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => NoteSearchScreen()),
              );
              _loadData(); // 노트 추가 후 화면으로 돌아왔을 때 데이터 새로고침
            },
          )
        ],
        shape: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      body: Container(
        color: Colors.purple.withOpacity(0.05),
        padding: EdgeInsets.fromLTRB(
          0,
          10,
          0,
          0,
        ),
        child: FutureBuilder<List<WineNoteCard>>(
          future: _notesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: NoteListSkeleton(context),
              );
            } else if (snapshot.hasError) {
              return Container(
                  alignment: Alignment.center,
                  child: Text('Error: ${snapshot.error}'));
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
              return Container(
                  alignment: Alignment.center,
                  child: Text('테이스팅 노트가 존재하지 않습니다.'));
            }
          },
        ),
      ),
    );
  }
}

// 스켈레톤 UI
Widget NoteListSkeleton(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: [
        SizedBox(height: 10),
        Column(
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: ElevatedButton(
                onPressed: null,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사진 부분 시작
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: double.maxFinite,
                          height: 200,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Container(color: Colors.grey[200]!),
                        ),
                      ),
                      // 사진 부분 끝

                      // 정보 부분 시작
                      Flexible(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              SizedBox(height: 5),
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              SizedBox(height: 5),
                              Flexible(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  color: Colors.grey[200]!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 정보 부분 끝
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 150),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );
}
