// import 'package:flutter/material.dart';
// import 'package:frontend/screens/home_screen.dart';
// import 'package:frontend/screens/recommend/recommend_screen.dart';
// import 'package:frontend/screens/feed/feed_screen.dart';
// import 'package:frontend/screens/note/note_list_screen.dart';
// import 'package:frontend/screens/mypage/mypage_screen.dart';
// import 'package:frontend/widgets/search/search_wine_list_widget.dart';
//
//
// class BottomBarWidget extends StatefulWidget {
//   @override
//   _BottomBarWidgetState createState() => _BottomBarWidgetState();
// }
//
// class _BottomBarWidgetState extends State<BottomBarWidget> {
//   int _selectedIndex = 0;
//
//   List<Widget> _widgetOptions = [
//     SearchWineListWidget(context),
//     FeedScreen(),
//     NoteListScreen(),
//     MyPageScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.comment),
//             label: 'Feed',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.edit_note),
//             label: 'Note',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'My Page',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.orange,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
