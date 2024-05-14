import 'package:flutter/material.dart';
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
              onPressed: () async {
                SearchService.removeCellar(widget.wineId);
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
              onPressed: () async {
                SearchService.addCellar(widget.wineId);
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
