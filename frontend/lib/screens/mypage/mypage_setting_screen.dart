import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/mypage/mypage_cover_screen.dart';
import 'package:frontend/screens/mypage/mypage_survey_screen.dart';
import 'package:frontend/services/user_service.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';
import 'package:provider/provider.dart';

class MyPageSettingScreen extends StatelessWidget {
  const MyPageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('${user.imageUrl}'),
                    radius: 20,
                  ),
                  SizedBox(width: 20),
                  Text('${user.nickname}'),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomListTile(
            leadingIcon: Icons.image_outlined,
            title: '커버 변경',
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MyPageCoverScreen(),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          CustomListTile(
            leadingIcon: Icons.checklist,
            title: '취향 설문 수정',
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MyPageSurveyScreen(),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: UserService.logout,
              child: Text(
                '로그아웃',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
