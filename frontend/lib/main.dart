import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'providers/bottombar_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider(User.dummy())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'VinOpener',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: AppColors.backgroundColor,
          ),
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        home: HomeScreen(), // 초기 화면
        // 다른 라우트들을 여기에 추가
        // );
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
