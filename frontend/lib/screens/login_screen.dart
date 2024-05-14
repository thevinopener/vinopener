import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          SizedBox(height: 50),
          OutlinedButton(
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
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        isSurveyDone ? SurveyScreen() : HomeScreen()),
              );
            },
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
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xFF7587A7), width: 1), // 1px 테두리 설정
            ),
          ),
        ],
      ),
    );
  }
}
