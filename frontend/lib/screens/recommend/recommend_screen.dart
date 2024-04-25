import 'package:flutter/material.dart';

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommend'),
      ),
      body: const Center(
        child: Text('recommend_screen.dart',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
      ),
    );
  }
}