import 'package:flutter/material.dart';

class SearchCameraCaptureScreen extends StatefulWidget {

  final String recognizedText;

  const SearchCameraCaptureScreen({
    super.key,
    required this.recognizedText,
  });

  @override
  _SearchCameraCaptureScreenState createState() =>
      _SearchCameraCaptureScreenState();
}

class _SearchCameraCaptureScreenState extends State<SearchCameraCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('캡처 화면')),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black,
        child: Column(
          children: [
            Text(
              widget.recognizedText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
