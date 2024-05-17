import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_label_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/wine_model.dart';
import '../../services/wine_service.dart';

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
      color: Colors.black.withOpacity(0.7),
      height: MediaQuery.of(context).size.height * 0.4,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(8),
                height: 5,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: PagedListView<int, Wine>(
                scrollDirection: Axis.horizontal,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Wine>(
                  itemBuilder: (context, item, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) =>
                              SearchDetailScreen(wineId: item.id!),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            // color: Colors.grey,
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                    image: CachedNetworkImageProvider(
                                        item.imageUrl!),
                                    fit: BoxFit.fitHeight),
                                Positioned(
                                  bottom: 0,
                                  right: 15,
                                  left: 15,
                                  child: WineLabel(type: item.type!),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.green,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.495,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.winery!,
                                  style: TextStyle(
                                    fontSize: AppFontSizes.mediumSmall,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  item.name!,
                                  style: TextStyle(
                                    fontSize: AppFontSizes.medium,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    // NationFlag and NationName logic will be added here
                                    NationFlag(
                                        country: item.country!,
                                        height: 25,
                                        width: 25),
                                    SizedBox(width: 10),
                                    Text(item.country!),
                                  ],
                                ),
                                // Text('\$ ${item.price!}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (context) => Container(
                    // 검색했는데 없을 때
                    alignment: Alignment.center,
                    child: Text(
                      '검색 결과가 없습니다.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSizes.mediumLarge,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  firstPageErrorIndicatorBuilder: (context) => Container(
                    // 검색어가 뭔가 이상할 때?
                    alignment: Alignment.center,
                    child: Text(
                      '검색 결과가 없습니다.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSizes.mediumLarge,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  animateTransitions: true,
                  transitionDuration:
                      Duration(seconds: 5), // TODO: 페이지 전환 지속시간을 정의
                  firstPageProgressIndicatorBuilder: (context) => Container(
                    // TODO: 첫페이지 데이터 로딩 중 표시될 화면
                    alignment: Alignment.center,
                    child: LoadingWineCard(),
                  ),
                  newPageErrorIndicatorBuilder: (context) => Container(
                      // TODO: 새 페이지를 로드하다 에러 터졌을 때 보여줄 화면
                    alignment: Alignment.center,
                    child: Text(
                      '검색 결과가 없습니다.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSizes.mediumLarge,
                          fontWeight: FontWeight.w600),
                    ),
                      ),
                  newPageProgressIndicatorBuilder: (context) => Container(
                      // TODO: 새 페이지 데이터 로딩 중 표시될 화면
                    child: LoadingWineCard(),
                      ),
                  noMoreItemsIndicatorBuilder: (context) => Container(
                      // TODO: 더이상 보여줄 화면이 없을 때 보여줄 화면
                    alignment: Alignment.center,
                    child: Text(
                      '마지막 항목입니다.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSizes.mediumLarge,
                          fontWeight: FontWeight.w600),
                    ),

                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWineCard extends StatelessWidget {
  const LoadingWineCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            // 사진 부분 시작
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Container(color: Colors.grey[200]!),
              ),
            ),
            // 사진 부분 끝

            // 정보 부분 시작
            Flexible(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.grey[200]!,
                      ),
                    ),
                    SizedBox(height: 5),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.grey[200]!,
                      ),
                    ),
                    SizedBox(height: 5),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.grey[200]!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 정보 부분 끝
          ],
        ),
      ),
    );
  }
}