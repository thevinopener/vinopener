import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/intro_screen.dart';
import 'package:provider/provider.dart';
import 'providers/bottombar_provider.dart';
import 'providers/search/search_wine_list_provider.dart';
import 'providers/search/search_wine_detail_provider.dart';
import 'providers/search/search_history_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider(UserModel.dummy())),
        ChangeNotifierProvider(create: (_) => FeedTabState([])),
        ChangeNotifierProvider(create: (_) => NewFeedWineListProvider()),
        ChangeNotifierProvider(create: (_) => RecommendProvider()),
        ChangeNotifierProvider(create: (_) => SearchWineListProvider()),
        ChangeNotifierProvider(create: (_) => SearchWineDetailProvider()),
        ChangeNotifierProvider(create: (_) => SearchHistoryProvider()),
        ChangeNotifierProvider(create: (_) => NoteWineProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
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
        home: IntroScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
