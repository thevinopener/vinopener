import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/widgets/common/atoms/wine_taste_chart_widget.dart';
import 'package:frontend/widgets/note/note_detail_card_widget.dart';
import 'package:intl/intl.dart';

import '../../constants/fonts.dart';
import '../../services/note_service.dart';
import '../../widgets/common/atoms/wine_color_widget.dart';
import '../../widgets/common/atoms/wine_flavour_widget.dart';
import '../../widgets/common/atoms/wine_taste_param_widget.dart';

class NoteResultScreen extends StatelessWidget {
  final int id;

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
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: FutureBuilder<NoteDetailModel>(
        future: NoteService.getNoteDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final noteDetail = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    NoteDetailCard(noteWine: noteDetail.wine),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  WineColorBlock(
                                    wineColor: WineColors.wineColorMap[noteDetail.color.name] ?? Colors.grey,
                                    colorName: noteDetail.color.name,
                                  ),
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('yyyy.MM.dd').format(noteDetail.updatedTime),
                                        style: TextStyle(
                                          fontSize: AppFontSizes.mediumSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Column(
                                    children: [
                                      Text(
                                        "총점",
                                        style: TextStyle(
                                          fontSize: AppFontSizes.mediumSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Text(
                                            noteDetail.rating.toString(),
                                            style: TextStyle(fontSize: AppFontSizes.mediumSmall),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '향',
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // 스크롤 동작을 비활성화합니다.
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, // 한 줄에 3개의 항목이 표시됩니다.
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              childAspectRatio: 1, // 항목의 비율을 1:1로 설정합니다.
                            ),
                            itemCount: noteDetail.flavours.length,
                            itemBuilder: (context, index) {
                              final flavour = noteDetail.flavours[index];
                              return WineFlavour(
                                flavour: Flavour(id:flavour.id , taste: flavour.taste),
                                isSelected: false, // 필요에 따라 선택 상태를 관리합니다.
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '맛',
                                style: TextStyle(
                                  fontSize: AppFontSizes.mediumSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TasteChart(
                                  acidity: noteDetail.acidity,
                                  alcohol: noteDetail.alcohol,
                                  tannin: noteDetail.tannin,
                                  sweetness: noteDetail.sweetness,
                                  intensity: noteDetail.intensity,
                                ),
                                TasteParam(label: '당도', value: noteDetail.sweetness, readOnly: true),
                                SizedBox(height: 10),
                                TasteParam(label: '산도', value: noteDetail.acidity, readOnly: true),
                                SizedBox(height: 10),
                                TasteParam(label: '바디', value: noteDetail.intensity, readOnly: true),
                                SizedBox(height: 10),
                                TasteParam(label: '타닌', value: noteDetail.tannin, readOnly: true),
                                SizedBox(height: 10),
                                TasteParam(label: '알코올', value: noteDetail.alcohol, readOnly: true),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      '의견',
                                      style: TextStyle(
                                        fontSize: AppFontSizes.mediumSmall,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height * 0.4,
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
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    noteDetail.opinion,
                                    style: TextStyle(fontSize: AppFontSizes.mediumSmall),
                                  ),
                                ),
                                SizedBox(height: 40),
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
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
