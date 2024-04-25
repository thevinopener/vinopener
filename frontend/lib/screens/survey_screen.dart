import 'package:flutter/material.dart';
import 'home_screen.dart'; // 홈 화면을 import

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Survey")),
      body: Center(
        child: ElevatedButton(
          child: Text("설문조사 완료"),
          onPressed: () {
            // 설문조사 화면에서 홈 화면으로 이동하며 스택을 초기화
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}
