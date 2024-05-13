import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
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

    return Scaffold(
      body: Container(
        color: AppColors.primary.withOpacity(0.05),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.asset('assets/images/intro_logo.png'),
          ),
        ),
      ),
    );
  }
}
