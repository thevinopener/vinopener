import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/token.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/survey_screen.dart';
import 'package:frontend/services/user_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:frontend/utils/api_client.dart';

import '../constants/colors.dart';
import '../widgets/wine/login_empty_animation.dart';
import 'introduce_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel loginUser = UserModel.dummy();
    final userProvider = Provider.of<UserProvider>(context);

    Future<String?> onGoogleLoginPress(BuildContext context) async {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile',
          'https://www.googleapis.com/auth/userinfo.profile'
        ],
      );

      try {
        GoogleSignInAccount? account = await googleSignIn.signIn();
        print(account);
        loginUser.email = account?.email;
        loginUser.nickname = account?.displayName;
        loginUser.imageUrl =
            account?.photoUrl ?? 'https://picsum.photos/200/300';
        final GoogleSignInAuthentication? googleAuth =
            await account?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        // await FirebaseAuth.instance.signInWithCredential(credential);
        return credential.accessToken;
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('로그인 실패!')));
      }
      throw Error();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.purple.withOpacity(0.03),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(
                    'assets/images/vinopener_logo.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                Container(
                  child: Text(
                    'VINOPENER',
                    style: TextStyle(
                      fontSize: AppFontSizes.veryLarge,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('오늘은 어떤 나라의 와인을 마셔볼까요?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSizes.medium),
                ),
                SizedBox(height: 30),
                LoginEmptyAnimation(context),
              ],
            ),
          ),



          OutlinedButton(
            onLongPress: () {
              showToastWidget(
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: AppColors.primary,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error, color: Colors.white),
                      SizedBox(width: 12.0),
                      Text(
                        '꾹~ 아니고 한번만 툭 !',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: AppFontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                context: context,
                duration: Duration(seconds: 2),
                position: StyledToastPosition(
                  align: Alignment(0, -0.4), // 좌상단 (-1, -1) / 우하단 (1, 1)
                ),
              );
            },
            onPressed: () async {
              String? accessToken = await onGoogleLoginPress(context);
              if (accessToken != null) {
                Token token = await UserService.login(accessToken);
                print(token.accessToken);
                loginUser.accessToken = token.accessToken;
                loginUser.refreshToken = token.refreshToken;
                ApiClient.setAccessToken(token.accessToken!);
                ApiClient.setRefreshToken(token.refreshToken!);
                loginUser.id = await UserService.getMyId();
                userProvider.setUser(loginUser);
              }
              var survey = null;
              try {
                survey = await UserService.getSurvey();
              } catch (e) {
                print(e);
              }
              bool isSurveyDone = (survey == null);
              // bool isSurveyDone = true;
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                    isSurveyDone ? OnboardingPage() : HomeScreen()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/google_icon.svg'),
                SizedBox(width: 12),
                Text(
                  '구글로 시작하기',
                  style: GoogleFonts.roboto(
                    fontSize: AppFontSizes.mediumSmall,
                    color: Color(0xFF7587A7),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),),
            style: OutlinedButton.styleFrom(
              side:
              BorderSide(color: Color(0xFF7587A7), width: 1), // 1px 테두리 설정
            ),
          ),
        ],
      ),
    ),
    );
  }
}
