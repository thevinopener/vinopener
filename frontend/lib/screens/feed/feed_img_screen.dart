import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/screens/feed/feed_content_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
      if (_imageFile == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('이미지를 첨부해주세요!')));
      } else {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => FeedContentScreen(
              imageFile: _imageFile,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<NewFeedWineListProvider>(context, listen: false)
                .clearWineList();
            Navigator.of(context).pop();
          },
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
        backgroundColor: Colors.purple.withOpacity(0.05),
      ),
      body: Container(
        color: Colors.purple.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _imageFile == null
                ? Center(
                    child: Image.asset(
                      'assets/images/intro_logo.png',
                      width: min(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.5),
                      height: min(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.5),
                    ),
                  )
                : Center(
                    child: Container(
                      width: min(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.5),
                      height: min(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.5),
                      child: Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(height: 50),
            Center(
              child: FilledButton.icon(
                onPressed: showOptions,
                icon: Icon(Icons.image_search),
                label: Text(
                  '이미지 찾기',
                  style: TextStyle(
                    fontSize: AppFontSizes.mediumSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
