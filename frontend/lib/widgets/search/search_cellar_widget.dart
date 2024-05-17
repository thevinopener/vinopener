import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/search_service.dart';

import '../../providers/search/search_wine_detail_provider.dart';

class SearchCellarWidget extends StatefulWidget {
  final int wineId;
  bool cellar;

  SearchCellarWidget({
    Key? key,
    required this.wineId,
    required this.cellar,
  }) : super(key: key);

  @override
  State<SearchCellarWidget> createState() => _SearchCellarWidgetState();
}

class _SearchCellarWidgetState extends State<SearchCellarWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchWineDetailProvider>(
      builder: (context, wineDetailProvider, child) {
        if (widget.cellar) {
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
                        Icon(Icons.sentiment_very_satisfied_outlined,
                            color: Colors.white),
                        SizedBox(width: 10.0),
                        Text(
                          '벌써 다 마셨나요?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: AppFontSizes.medium,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Icon(Icons.sentiment_very_satisfied_outlined,
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
                SearchService.removeCellar(widget.wineId);
                showToastWidget(
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '셀러에서 삭제되었습니다.',
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
                  duration: Duration(seconds: 1),
                  position: StyledToastPosition(
                    align: Alignment(0, 0.9), // 좌상단 (-1, -1) / 우하단 (1, 1)
                  ),
                );
                setState(() {
                  widget.cellar = false;
                });
              },
              child: Text(
                '셀러 삭제',
                style: TextStyle(
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: AppColors.primary,
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
                        Icon(Icons.sentiment_satisfied_outlined,
                            color: Colors.white),
                        SizedBox(width: 10.0),
                        Text(
                          '대단한 와인수집가네요 !',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: AppFontSizes.medium,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Icon(Icons.sentiment_satisfied_outlined,
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
                SearchService.addCellar(widget.wineId);
                showToastWidget(
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '셀러에 추가되었습니다.',
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
                  duration: Duration(seconds: 1),
                  position: StyledToastPosition(
                    align: Alignment(0, 0.9), // 좌상단 (-1, -1) / 우하단 (1, 1)
                  ),
                );
                setState(() {
                  widget.cellar = true;
                });
              },
              child: Text(
                '셀러 추가',
                style: TextStyle(
                  color: AppColors.primary,
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
                  color: AppColors.primary,
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
