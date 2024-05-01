import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/feed/feed_content_screen.dart';
import 'package:image_picker/image_picker.dart';

class FeedImageScreen extends StatefulWidget {
  const FeedImageScreen({super.key});

  @override
  State<FeedImageScreen> createState() => _FeedImageScreenState();
}

class _FeedImageScreenState extends State<FeedImageScreen> {
  File? _imageFile;
  final _imagePicker = ImagePicker();

  Future pickImageFromGallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedImage!.path);
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              '사진첩',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppFontSizes.mediumSmall,
              ),
            ),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              pickImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void navigateNext() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedContentScreen(
            imageFile: _imageFile,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
        title: Text(
          '이미지 업로드',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: navigateNext,
            child: Text(
              '다음',
              style: TextStyle(
                fontSize: AppFontSizes.mediumSmall,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          _imageFile == null
              ? Image.asset(
                  'assets/images/wine.jpg',
                  width: 400,
                  height: 400,
                )
              : Image.file(
                  _imageFile!,
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              child: Text(
                '이미지 선택',
                style: TextStyle(
                  fontSize: AppFontSizes.mediumSmall,
                  color: AppColors.primary,
                ),
              ),
              onPressed: showOptions,
            ),
          ),
        ],
      ),
    );
  }
}
