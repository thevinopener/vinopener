import 'package:flutter/material.dart';

class FeedListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: const Center(
        child: Text('feed_screen.dart',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
      ),
    );
  }
}