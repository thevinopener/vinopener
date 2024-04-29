import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';

class SearchCameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        height: double.maxFinite,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Camera',
              style: TextStyle(
                fontSize: AppFontSizes.large,
              ),
            ),
          ],
        )
      ),
    );
  }
}
