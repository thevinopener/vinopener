import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'providers/bottombar_provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
      ],
      child: MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:
      MaterialApp(
        title: 'VinOpener',
        home: HomeScreen(), // 초기 화면
        // 다른 라우트들을 여기에 추가
      // );
        debugShowCheckedModeBanner: false,
    ),);
  }
}
