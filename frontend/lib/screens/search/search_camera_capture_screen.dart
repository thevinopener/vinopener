// SearchCameraCaptureScreen.dart
import 'dart:io';
import 'package:flutter/material.dart';

class SearchCameraCaptureScreen extends StatefulWidget {
  final String imagePath;
  final String recognizedText;

  const SearchCameraCaptureScreen({
    super.key,
    required this.imagePath,
    required this.recognizedText,
  });

  @override
  _SearchCameraCaptureScreenState createState() => _SearchCameraCaptureScreenState();
}

class _SearchCameraCaptureScreenState extends State<SearchCameraCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캡처 화면')),
      body: Container(
        child: Column(
          children: [
            Image.file(File(widget.imagePath)),
            Text(widget.recognizedText),
          ],
        ),
      ),
    );
  }
}
