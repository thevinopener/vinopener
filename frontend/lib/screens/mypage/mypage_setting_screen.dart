import 'package:flutter/material.dart';
import 'package:frontend/widgets/common/molecules/custom_list_tile_widget.dart';

class MyPageSettingScreen extends StatelessWidget {
  const MyPageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: AssetImage('assets/images/penguin.jpg'),
                    radius: 20,
                  ),
                  SizedBox(width: 20),
                  Text('user.nickname'),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomListTile(leadingIcon: Icons.image_outlined, title: '커버 변경'),
          SizedBox(height: 10),
          CustomListTile(leadingIcon: Icons.checklist, title: '취향 설문 수정'),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () => {print('로그아웃')},
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
