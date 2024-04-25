import 'package:flutter/material.dart';
import 'survey_screen.dart'; // 설문조사 화면을 import

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          child: Text("로그인 하기"),
          onPressed: () {
            // 로그인 화면에서 설문조사 화면으로 이동
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurveyScreen()));
          },
        ),
      ),
    );
  }
}
