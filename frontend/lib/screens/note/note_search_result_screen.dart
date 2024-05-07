import 'package:flutter/material.dart';
import 'package:frontend/widgets/search/search_bar_widget.dart';

import '../../widgets/note/note_search_list_widget.dart';


class NoteSearchResultScreen extends StatefulWidget {

  final String searchValue;
  NoteSearchResultScreen(this.searchValue);

  @override
  _NoteSearchResultScreenState createState() => _NoteSearchResultScreenState();
}

class _NoteSearchResultScreenState extends State<NoteSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(
            autoFocus: false,
            searchValue: widget.searchValue,
            contextType: SearchContext.searchResultScreen,),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          //   child: Text(
          //     '\"${widget.searchValue}\" 검색 결과',
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontSize: 16, // 조정 가능한 폰트 크기
          //     ),
          //     softWrap: true,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
            child: Text(
              '총 11 건 검색완료',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              softWrap: true, // 감싸주는 애
              overflow: TextOverflow.ellipsis,  // 글자수 넘치면 ... 으로 바꿔주는애
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: NoteSearchWineListWidget(context),
          ),
        ],
      ),
    );
  }
}
