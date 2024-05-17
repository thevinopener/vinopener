import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../constants/colors.dart';
import '../../models/wine_model.dart';
import '../../services/wine_service.dart';
import '../../widgets/feed/feed_wine_item.dart';

class CameraBottomSheetView extends StatefulWidget {
  final String recognizedText;

  CameraBottomSheetView({
    Key? key,
    required this.recognizedText,
  }) : super(key: key);

  @override
  State<CameraBottomSheetView> createState() => _CameraBottomSheetViewState();
}

class _CameraBottomSheetViewState extends State<CameraBottomSheetView> {
  TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  int? _selectedWineId;
  static const _pageSize = 10;
  final PagingController<int, Wine> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await WineService.pageSearchWineList(widget.recognizedText, pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.4,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.primary
                              .withOpacity(0.1), // 여기서 원하는 경계선의 색상으로 변경하세요.
                          width: 0.0, // 경계선의 두께를 조절할 수 있습니다.
                        ),
                      ),
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(5),
                      //x 버튼
                      child: TextButton(
                        child: Icon(
                          Icons.close,
                          size: 30,
                          color: AppColors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primary.withOpacity(0.1),
                        alignment: Alignment.center,
                        //show your dream
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          // color: Colors.red,
                          child: _isLoading
                              ? Center(child: CircularProgressIndicator())
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      PagedListView<int, Wine>(
                                        pagingController: _pagingController,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<Wine>(
                                          itemBuilder: (context, item, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      SearchDetailScreen(
                                                          wineId: item.id!),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              child:



                                              // TODO: 이게 보여줘야되는 항목인데... 안보임요
                                              FeedWineItem(
                                                wine: item,
                                                isSelected: false,
                                              ),




                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder:
                                              (context) => Center(
                                            child: Text(
                                              '🔍 검색된 와인이 없습니다. 🔍',
                                              style: TextStyle(
                                                fontSize:
                                                    AppFontSizes.mediumLarge,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          firstPageErrorIndicatorBuilder:
                                              (context) => Text(
                                            '🔍 검색된 와인이 없습니다. 🔍',
                                            style: TextStyle(
                                              fontSize:
                                                  AppFontSizes.mediumSmall,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          newPageErrorIndicatorBuilder:
                                              (context) => Text(
                                            '마지막 항목',
                                            style: TextStyle(
                                              fontSize:
                                                  AppFontSizes.mediumSmall,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),

                        // Text(
                        //   widget.recognizedText,
                        //   style: TextStyle(
                        //       color: AppColors.white,
                        //       fontSize: AppFontSizes.mediumLarge),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
