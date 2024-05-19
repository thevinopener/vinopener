import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_chat_button/floating_chat_button.dart';
import 'package:flutter/widgets.dart';
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
      final noteWineProvider =
      Provider.of<NoteWineProvider>(context, listen: false);
      final Wine? wine = noteWineProvider.getWine();
      print(wine);
      if (wine == null) {
        print('Wine data is not loaded.');
        return;
      }
      noteProvider.reset();
      noteProvider.updateNoteProvider(
        wineId: wine.id ?? 0,
        colorId: 1,
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
      MediaQuery.of(context).size.height * 0.8, // 첫 페이지 높이
      MediaQuery.of(context).size.height * 1.2, // 두 번째 페이지 높이
      MediaQuery.of(context).size.height * 1.0, // 세 번째 페이지 높이
      MediaQuery.of(context).size.height * 0.8, // 네 번째 페이지 높이
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '테이스팅노트 작성',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '이전',
            style: TextStyle(
              fontSize: AppFontSizes.mediumSmall,
              fontWeight: FontWeight.bold,
              color: Colors.red, // AppColors에 정의된 색상 사용
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.close,
              color: AppColors.black,
              size: 24,
            ),
            onPressed: () {
              // SttWidgetState의 stopTtsAndStt 메서드를 호출
              Provider.of<NoteProvider>(context, listen: false).reset();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey)),
        backgroundColor: Colors.purple.withOpacity(0.05),
      ),
      body: Container(
        color: Colors.purple.withOpacity(0.05),
        child: Column(
          children: [
            SizedBox(height: 20),
            NoteWineCard(
                wine: Provider.of<NoteWineProvider>(context).getWine()),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  NoteColorScreen(
                    controller: _controller,
                  ),
                  NoteSmellScreen(
                    controller: _controller,
                  ),
                  NoteTasteScreen(controller: _controller),
                  NoteOpinionScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingChatButton(
        chatIconBackgroundColor: AppColors.primary,
        chatIconBorderColor: AppColors.primary,
        chatIconBorderWidth: 0,
        chatIconWidget: Container(
          margin: EdgeInsets.all(7),
          child: Image(
            image: AssetImage("assets/images/ai_icon.gif"),
            width: 50,
            height: 50,
          ),
        ),
        onTap: (BuildContext context) {
          _showBottomSheet(context);
        },
      ),
    );
  }
}