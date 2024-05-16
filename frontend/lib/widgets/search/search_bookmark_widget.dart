import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
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
              onLongPress: () {
                showToastWidget(
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: AppColors.black,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.sentiment_dissatisfied_outlined,
                            color: Colors.white),
                        SizedBox(width: 10.0),
                        Text(
                          '이거 별로에요..?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: AppFontSizes.medium,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Icon(Icons.sentiment_dissatisfied_outlined,
                            color: Colors.white),
                      ],
                    ),
                  ),
                  context: context,
                  duration: Duration(seconds: 2),
                  position: StyledToastPosition(
                    align: Alignment(0, -0.1), // 좌상단 (-1, -1) / 우하단 (1, 1)
                  ),
                );
              },
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
              onLongPress: () {
                showToastWidget(
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: AppColors.black,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.sentiment_satisfied_rounded, color: Colors.white),
                        SizedBox(width: 10.0),
                        Text(
                          '고민은 시음을 늦출 뿐..!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: AppFontSizes.medium,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Icon(Icons.sentiment_satisfied_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                  context: context,
                  duration: Duration(seconds: 2),
                  position: StyledToastPosition(
                    align:
                    Alignment(0, -0.1), // 좌상단 (-1, -1) / 우하단 (1, 1)
                  ),
                );
              },
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
