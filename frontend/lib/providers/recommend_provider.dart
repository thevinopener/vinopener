import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/search/search_text_screen.dart';

class RecommendProvider with ChangeNotifier {

  void moveToSearchTextScreen(context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SearchTextScreen(),
      ),
    );
  }

}