import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed.dart';
import 'package:frontend/services/feed_service.dart';

class FeedContentScreen extends StatefulWidget {
  final File? imageFile;

  FeedContentScreen({super.key, this.imageFile});

  @override
  State<FeedContentScreen> createState() => _FeedContentScreenState();
}

class _FeedContentScreenState extends State<FeedContentScreen> {
  bool isPrivate = false;

  @override
  Widget build(BuildContext context) {
    void postFeed() {
      FeedService.postFeed(Feed.dummy());
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.navigate_before),
        ),
        title: Center(
          child: Text(
            '피드 작성',
            style: TextStyle(
              fontSize: AppFontSizes.mediumSmall,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: postFeed,
            child: Text(
              '완료',
              style: TextStyle(
                fontSize: AppFontSizes.medium,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.imageFile == null
                ? Image.asset(
                    'assets/images/wine.jpg',
                    width: 400,
                    height: 400,
                  )
                : Image.file(
                    widget.imageFile!,
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
            SizedBox(height: 20),
            Text(
              '와인 선택',
              style: TextStyle(
                fontSize: AppFontSizes.mediumSmall,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('와인 검색창'),
            Text('와인 카드'),
            SizedBox(height: 20),
            Text(
              '피드 내용',
              style: TextStyle(
                fontSize: AppFontSizes.mediumSmall,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '내용을 입력하세요.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '피드 설정',
              style: TextStyle(
                fontSize: AppFontSizes.mediumSmall,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.visibility_off_outlined),
              title: Text('공개 여부'),
              trailing: Switch(
                value: isPrivate,
                onChanged: (bool value) {
                  setState(() {
                    isPrivate = !isPrivate;
                  });
                },
                activeColor: AppColors.primary,
                inactiveTrackColor: AppColors.primaryLight,
                thumbColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white; // 예를 들어 선택된 상태일 때는 빨간색으로
                    }
                    return Colors.grey; // 기본 상태는 흰색
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
