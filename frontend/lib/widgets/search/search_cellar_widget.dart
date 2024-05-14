import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/services/search_service.dart';

import '../../providers/search/search_wine_detail_provider.dart';

class SearchCellarWidget extends StatelessWidget {
  final int wineId;

  const SearchCellarWidget({
    Key? key,
    required this.wineId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchWineDetailProvider>(
      builder: (context, wineDetailProvider, child) {
        final wineDetail = wineDetailProvider.wineDetail;
        if (wineDetail == null) {
          return Container();
        }
        return wineDetail.isCellar
            ? Container(
          width: double.maxFinite,
          child: FilledButton(
            onPressed: () {
              SearchService.removeCellar(wineDetail.id);
            },
            child: Text(
              '셀러 삭제',
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
        )
            : Container(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              SearchService.addCellar(wineDetail.id);
            },
            child: Text(
              '셀러 추가',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: AppFontSizes.medium,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
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
      },
    );
  }
}
