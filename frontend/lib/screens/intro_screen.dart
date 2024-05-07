import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );

    return Image.asset('assets/images/intro.gif', fit: BoxFit.cover);
  }
}
