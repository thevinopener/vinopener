import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/common/atoms/wine_color_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_taste_chart_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_taste_param_widget.dart';
import 'package:frontend/widgets/note/note_detail_card_widget.dart';
import 'package:intl/intl.dart';

import '../../constants/fonts.dart';
import '../../models/note_model.dart';

class NoteResultScreen extends StatelessWidget {
  final int id;
  final NoteDetailWineReview noteDetailWineReview =
      NoteDetailWineReview.dummy();

  NoteResultScreen({super.key, required this.id});



  @override
  Widget build(BuildContext context) {

    void goFirst() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Tasting Note',
            style: TextStyle(
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: goFirst,
              icon: Icon(Icons.close),
            )
          ],
          shape: Border(bottom: BorderSide(color: Colors.grey))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NoteDetailCard(noteDetailWine: noteDetailWineReview.wine),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '색',
                            style: TextStyle(
                                fontSize: AppFontSizes.mediumSmall,
                                fontWeight: FontWeight.bold),
                          ),
                          WineColorBlock(
                              wineColor: WineColors.wineColorMap[
                                  noteDetailWineReview.color.name],
                              colorName: noteDetailWineReview.color.name)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "최종작성일",
                                style: TextStyle(
                                    fontSize: AppFontSizes.mediumSmall,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('yyyy.MM.dd')
                                    .format(noteDetailWineReview.updatedTime),
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumSmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "총점",
                                style: TextStyle(
                                    fontSize: AppFontSizes.mediumSmall,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    noteDetailWineReview.rating.toString(),
                                    style: TextStyle(
                                        fontSize: AppFontSizes.mediumSmall),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TasteChart(
                            acidity: noteDetailWineReview.acidity,
                            alcohol: noteDetailWineReview.alcohol,
                            tannin: noteDetailWineReview.tannin,
                            sweetness: noteDetailWineReview.sweetness,
                            intensity: noteDetailWineReview.intensity),
                        TasteParam(
                            label: '당도', value: noteDetailWineReview.sweetness),
                        SizedBox(
                          height: 10,
                        ),
                        TasteParam(
                            label: '산도', value: noteDetailWineReview.acidity),
                        SizedBox(
                          height: 10,
                        ),
                        TasteParam(
                            label: '바디', value: noteDetailWineReview.intensity),
                        SizedBox(
                          height: 10,
                        ),
                        TasteParam(
                            label: '타닌', value: noteDetailWineReview.tannin),
                        SizedBox(
                          height: 10,
                        ),
                        TasteParam(
                            label: '알코올', value: noteDetailWineReview.alcohol),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              '의견',
                              style: TextStyle(
                                  fontSize: AppFontSizes.mediumSmall,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: MediaQuery.of(context).size.height*0.4,
                          padding: EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x4C000000),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Text(noteDetailWineReview.opinion, style: TextStyle(fontSize: AppFontSizes.mediumSmall),),
                        ),
                        SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
