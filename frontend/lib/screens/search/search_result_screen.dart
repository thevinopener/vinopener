import 'package:flutter/material.dart';
import 'package:frontend/widgets/search/search_bar_widget.dart';
import 'package:frontend/widgets/search/search_wine_list_widget.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/colors.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchValue;

  SearchResultScreen(this.searchValue);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              '\"${widget.searchValue}\" 검색 결과',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16, // 조정 가능한 폰트 크기
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '총 11 건 검색완료',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: SearchWineListWidget(context),
          ),
        ],
      ),
    );
  }
}
