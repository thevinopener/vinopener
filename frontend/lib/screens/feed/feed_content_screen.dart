import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed/feed_post_requests.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/screens/feed/feed_wine_search_screen.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';
import 'package:frontend/widgets/wine/wine_item_widget.dart';
import 'package:provider/provider.dart';

class FeedContentScreen extends StatefulWidget {
  File? imageFile;

  FeedContentScreen({super.key, this.imageFile});

  @override
  State<FeedContentScreen> createState() => _FeedContentScreenState();
}

class _FeedContentScreenState extends State<FeedContentScreen> {
  List<Wine> wineList = [];

  FocusNode _focusNode = FocusNode();

  TextEditingController contentController = TextEditingController();
  String? content;

  bool isPublic = true;

  void searchWine(String query) {
    print('search');
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => FeedWineSearchScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    wineList =
        Provider.of<NewFeedWineListProvider>(context, listen: false).wineList;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    wineList = Provider.of<NewFeedWineListProvider>(context)
        .wineList; // This will rebuild the widget when the wine list updates.

    void postFeed() async {
      content = contentController.text;
      List<int> wineIdList = [];
      var newFeedWineList =
      Provider.of<NewFeedWineListProvider>(context, listen: false)
          .getWineList();
      for (int i = 0; i < newFeedWineList.length; i++) {
        wineIdList.add(newFeedWineList[i].id!);
      }
      Provider.of<NewFeedWineListProvider>(context, listen: false)
          .clearWineList();
      MultipartFile multipartImageFile =
      await MultipartFile.fromFile(widget.imageFile!.path);
      FeedPostRequest feedPostRequest = FeedPostRequest(
        content!,
        isPublic,
        multipartImageFile,
        wineIdList,
      );
      FeedService.postFeed(feedPostRequest);
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '피드 작성',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: postFeed,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              widget.imageFile!,
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '와인 선택',
                    style: TextStyle(
                      fontSize: AppFontSizes.mediumSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<NewFeedWineListProvider>(context,
                          listen: false)
                          .clearWineList();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                FeedWineSearchScreen()), // 'SearchWineScreen'을 적절한 대상 화면으로 바꾸세요.
                      ).then((_) {
                        setState(() {
                          wineList =
                              Provider.of<NewFeedWineListProvider>(context)
                                  .getWineList();
                        });
                      });
                      ;
                    },
                    child: Container(
                      child: Column(
                        children: [
                          // Text('test'),
                          TextField(
                            focusNode: _focusNode,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: '와인을 검색하세요.',
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Consumer<NewFeedWineListProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: provider.wineList
                            .map((wine) => FeedWineItem(
                          wine: wine,
                          isSelected: false,
                        ))
                            .toList(),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    '피드 내용',
                    style: TextStyle(
                      fontSize: AppFontSizes.mediumSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), // 텍스트 필드의 둥근 모서리
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // 그림자 색상 및 투명도
                          spreadRadius: 1, // 그림자의 범위 확장
                          blurRadius: 3, // 그림자의 흐림 정도
                          offset: Offset(0, 2), // 그림자의 위치 조정 (x, y)
                        ),
                      ],
                    ),
                    child: TextField(
                      maxLines: 3,
                      controller: contentController,
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
                  ),
                  SizedBox(height: 10),
                  Text(
                    '피드 설정',
                    style: TextStyle(
                      fontSize: AppFontSizes.mediumSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomListTile(
                    leadingIcon: Icons.visibility_off_outlined,
                    title: '공개 여부',
                    trailing: Switch(
                      value: isPublic,
                      onChanged: (bool value) {
                        setState(() {
                          isPublic = !isPublic;
                        });
                      },
                      activeColor: AppColors.primary,
                      activeTrackColor: AppColors.primary,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: MaterialStateProperty.all(Colors.white),
                      trackOutlineColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
