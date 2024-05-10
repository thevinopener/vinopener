// flutter
import 'package:flutter/material.dart';
// shimmer
import 'package:shimmer/shimmer.dart';
// constants
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/constants/wine_label.dart';
// screens
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';

// 스켈레톤 UI
Widget SearchWineListSkeleton(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: ElevatedButton(
            onPressed: null,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 사진 부분 시작
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.maxFinite,
                      height: 200,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              width: double.maxFinite,
                              height: 20,
                              color: Colors.grey[200]!,
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            child: Container(
                              width: double.maxFinite,
                              height: 20,
                              color: Colors.grey[200]!,
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            child: Container(
                              width: double.maxFinite,
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
            style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 150),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
        );
      }),
    ),
  );
}

// 실제 검색 결과 위젯
Widget SearchWineListWidget(BuildContext context, List<dynamic> wineList) {
  return Container(
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          wineList.length,
              (index) {
            final wine = wineList[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchDetailScreen(
                            wineId: wine.id,
                          )));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사진 부분 시작
                      Flexible(
                        flex: 3,
                        child: Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: 200,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black, width: 1),
                              ),
                              child: Image.network(wine.imageUrl,
                                  fit: BoxFit.scaleDown),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: wineLabel(wine.type.toLowerCase()),
                            ),
                          ],
                        ),
                      ),
                      // 사진 부분 끝

                      // 정보 부분 시작
                      Flexible(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        wine.name,
                                        style: TextStyle(
                                          fontSize: AppFontSizes.mediumSmall,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  wine.winery,
                                  style: TextStyle(
                                    fontSize: AppFontSizes.medium,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    NationFlag(
                                        country: wine.country,
                                        height: 20,
                                        width: 20),
                                    SizedBox(width: 10),
                                    Text(
                                      wine.country,
                                      style: TextStyle(
                                        fontSize: AppFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
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
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 150),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
