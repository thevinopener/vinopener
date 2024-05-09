import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/token.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/survey_screen.dart';
import 'package:frontend/services/user_service.dart';
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
        loginUser.imageUrl = account?.photoUrl ?? 'https://picsum.photos/200/300';
        final GoogleSignInAuthentication? googleAuth =
        await account?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        return credential.accessToken;
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('로그인 실패!')));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
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
              bool isFirstLogin = true;
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => isFirstLogin? SurveyScreen() : HomeScreen()),
              );
            },
            child: Image.asset(
              'assets/images/google_login_button.png',
            ),
          )
        ],
      ),
    );
  }
}
