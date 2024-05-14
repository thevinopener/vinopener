import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/search_service.dart';
import 'package:frontend/providers/search/search_wine_detail_provider.dart';

class SearchBookmarkWidget extends StatefulWidget {
  final int wineId;
  bool bookmark;

  SearchBookmarkWidget({
    Key? key,
    required this.wineId,
    required this.bookmark,
  }) : super(key: key);

  @override
  State<SearchBookmarkWidget> createState() => _SearchBookmarkWidgetState();
}

class _SearchBookmarkWidgetState extends State<SearchBookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchWineDetailProvider>(
      builder: (context, wineDetailProvider, child) {
        if (widget.bookmark) {
          return Container(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () async {
                SearchService.removeBookmark(widget.wineId);
                setState(() {
                  widget.bookmark = false;
                });
              },
              child: Text(
                '즐겨찾기 삭제',
                style: TextStyle(
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: AppColors.secondary,
                  width: 2,
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () async {
                SearchService.addBookmark(widget.wineId);
                setState(() {
                  widget.bookmark = true;
                });
              },
              child: Text(
                '즐겨찾기 추가',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: AppColors.secondary,
                  width: 2,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
