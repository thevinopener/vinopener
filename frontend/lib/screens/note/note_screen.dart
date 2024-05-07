import 'package:flutter/material.dart';
import 'package:floating_chat_button/floating_chat_button.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/screens/note/note_color_screen.dart';
import 'package:frontend/screens/note/note_opinion_screen.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';
import 'package:frontend/screens/note/note_taste_screen.dart';
import 'package:frontend/widgets/note/note_wine_card_widget.dart';

import '../../constants/fonts.dart';
import 'note_ai_screen.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  late List<double> _heights; // 늦은 초기화를 사용하여 선언

  Future<void> _showBottomSheet(BuildContext bContext) async {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: bContext,
      builder: (context) => DismissibleBottomSheetView(
        childView: Container(
          width: double.infinity,
          color: Colors.white,
          child: const Center(

          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Wine wine = Wine.dummy();

    _heights = [
      MediaQuery.of(context).size.height * 0.82, // 첫 페이지 높이
      MediaQuery.of(context).size.height * 1.9, // 두 번째 페이지 높이
      MediaQuery.of(context).size.height * 1.0, // 세 번째 페이지 높이
      MediaQuery.of(context).size.height * 0.8, // 네 번째 페이지 높이
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasting Note',
          style: TextStyle(
            fontSize: AppFontSizes.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            NoteWineCard(wine: wine),
            Container(
              height: _heights[_currentPage],
              child: PageView(
                controller: _controller,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  NoteColorScreen(controller: _controller),
                  NoteSmellScreen(controller: _controller),
                  NoteTasteScreen(controller: _controller),
                  NoteOpinionScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingChatButton(
        chatIconBackgroundColor: AppColors.secondary,
        chatIconBorderColor: AppColors.secondary,
        chatIconBorderWidth: 4,
        chatIconWidget: Icon(
          Icons.spatial_audio_off,
          size: 55,
          color: AppColors.white,
        ),
        onTap: (BuildContext context) {
          _showBottomSheet(context);
        },
      ),
    );
  }
}
