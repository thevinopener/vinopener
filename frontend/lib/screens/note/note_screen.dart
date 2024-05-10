import 'package:flutter/material.dart';
import 'package:floating_chat_button/floating_chat_button.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';
import 'package:frontend/screens/note/note_color_screen.dart';
import 'package:frontend/screens/note/note_opinion_screen.dart';
import 'package:frontend/screens/note/note_smell_screen.dart';
import 'package:frontend/screens/note/note_taste_screen.dart';
import 'package:frontend/widgets/note/note_wine_card_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/fonts.dart';
import '../../constants/icon.dart';
import 'note_ai_screen.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  late List<double> _heights; // 늦은 초기화를 사용하여 선언

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeNoteProvider();
    });
  }

  void _initializeNoteProvider() {
    try {
      final noteProvider = Provider.of<NoteProvider>(context, listen: false);
      final noteWineProvider = Provider.of<NoteWineProvider>(context, listen: false);
      final Wine? wine = noteWineProvider.getWine();
  print(wine);
      if (wine == null) {
        print('Wine data is not loaded.');
        return;
      }


      noteProvider.updateNoteProvider(
          wineId: wine.id ?? 0,
          tannin: wine.tannin ?? 0.0,
          sweetness: wine.sweetness ?? 0.0,
          intensity: wine.intensity ?? 0.0,
          acidity: wine.acidity ?? 0.0,
          rating: wine.rating ?? 0.0,
      );
    } catch (e) {
      print('Failed to initialize note provider: $e');
    }
  }


  Future<void> _showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => DismissibleBottomSheetView(
        currentPage: _currentPage,
        onPageChangeRequest: (page) {
          _controller.jumpToPage(page);
          setState(() {
            _currentPage = page;
          });
        },
      ),
    );
  }

  void nextPage() {
    if (_currentPage < 3) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Wine wine = Provider.of<NoteWineProvider>(context).getWine();
    print('note wine: ' + wine.name!);

    _heights = [
      MediaQuery.of(context).size.height * 1.9, // 첫 페이지 높이
      MediaQuery.of(context).size.height * 1.9, // 두 번째 페이지 높이
      MediaQuery.of(context).size.height * 1.9, // 세 번째 페이지 높이
      MediaQuery.of(context).size.height * 1.9, // 네 번째 페이지 높이
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
            NoteWineCard(wine: Provider.of<NoteWineProvider>(context).getWine()),
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
        chatIconWidget: IconButton(
          hoverColor: AppColors.primary,
          onPressed: null,
          icon: Icon(
            Icons.nightlife_sharp,
            color: AppColors.white,
            size: 45,
          ),
        ),
        onTap: (BuildContext context) {
          _showBottomSheet(context);
        },
      ),
    );
  }
}
