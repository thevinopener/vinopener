import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: const Center(
        child: Text('mypage_screen.dart',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
      ),
    );
  }
}