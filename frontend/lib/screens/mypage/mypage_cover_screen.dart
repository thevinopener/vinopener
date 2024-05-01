import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/user_service.dart';
import 'package:image_picker/image_picker.dart';

class MyPageCoverScreen extends StatefulWidget {
  const MyPageCoverScreen({super.key});

  @override
  State<MyPageCoverScreen> createState() => _MyPageCoverScreenState();
}

class _MyPageCoverScreenState extends State<MyPageCoverScreen> {
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
      builder: (context) =>
          CupertinoActionSheet(
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.navigate_before),
        ),
        title: Text(
          '커버 변경',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              UserService.changeCover();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text(
              '완료',
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
        children: [
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
