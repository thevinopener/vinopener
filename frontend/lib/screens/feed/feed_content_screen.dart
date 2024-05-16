import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed/feed_post_requests.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/screens/feed/feed_wine_search_screen.dart';
import 'package:frontend/services/feed_service.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';
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
    contentController.addListener(() {
      if (contentController.text.length > 200) {
        contentController.text = contentController.text.substring(0, 200);
        contentController.selection = TextSelection.fromPosition(
          TextPosition(offset: contentController.text.length),
        );
      }
    });
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
      if (newFeedWineList.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('와인을 추가해주세요!')));
        return;
      }
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
      await FeedService.postFeed(feedPostRequest);
      Provider.of<FeedTabState>(context, listen: false).setFeedList();
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
          backgroundColor: Colors.purple.withOpacity(0.05),
        ),
        body: Container(
          color: Colors.purple.withOpacity(0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black,
                  width: min(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.5),
                  height: min(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.5),
                  child: Image.file(
                    widget.imageFile!,
                    fit: BoxFit.scaleDown,
                  ),
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
                                maxLength: 1,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: InputDecoration(
                                  hintText: '와인을 검색하세요.',
                                  prefixIcon: Icon(Icons.search),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  counterText: '',
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
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          maxLength: 200,
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
        ),
      ),
    );
  }
}
