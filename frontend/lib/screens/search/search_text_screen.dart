import 'package:flutter/material.dart';

class SearchTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Search Text'),
      ),
      body: const Center(
        child: Text('search_text_screen.dart',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
      ),
    );
  }
}