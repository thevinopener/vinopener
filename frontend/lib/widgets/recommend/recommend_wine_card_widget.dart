import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/recommend_provider.dart';
import 'package:frontend/models/recommend/recommend_wine_list.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';

import '../common/atoms/nation_flag_widget.dart';

Widget RecommendWineCardWidget(BuildContext context, {required String recommendType}) {
  final recommendProvider = Provider.of<RecommendProvider>(context, listen: false);
  List<RecommendWine> wineList;

  // recommendType에 따라 해당 목록을 선택
  switch (recommendType) {
    case 'view':
      wineList = recommendProvider.viewRecommendWineList;
      break;
    case 'preference':
      wineList = recommendProvider.preferenceRecommendWineList;
      break;
    case 'tasting-note':
      wineList = recommendProvider.tastingNoteRecommendWineList;
      break;
    case 'cellar':
      wineList = recommendProvider.cellarRecommendWineList;
      break;
    case 'rate':
      wineList = recommendProvider.rateRecommendWineList;
      break;
    case 'wine-detail':
      wineList = recommendProvider.wineDetailRecommendWineList;
    default:
      wineList = [];
      break;
  }

  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.4;

  return Container(
    height: 350,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          wineList.length,
              (index) {
            final wine = wineList[index];

            return Padding(
              padding: EdgeInsets.only(right: 20, left: index == 0 ? 20 : 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDetailScreen(wineId: wine.wineId)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: cardWidth,
                          height: 190,
                          color: Colors.white12,
                          child: Image.network(
                            wine.imageUrl,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: NationFlag(
                              country: wine.country,
                              height: 20,
                              width: 20),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'wine.name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          wine.winery,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(cardWidth, 300),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
