import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/intro_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/utils/api_client.dart';
import 'package:provider/provider.dart';
import 'providers/bottombar_provider.dart';
import 'providers/search/search_wine_list_provider.dart';
import 'providers/search/search_wine_detail_provider.dart';
import 'providers/search/search_history_provider.dart';
import 'package:google_fonts/google_fonts.dart';

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

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    eventBus.on<UserLogOutEvent>().listen((event) {
      navigatorKey.currentState?.pushReplacement(
        CupertinoPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'VinOpener',
        theme: ThemeData(
          fontFamily: GoogleFonts.gowunDodum().fontFamily,
          // textTheme: GoogleFonts.gowunDodumTextTheme(),
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
