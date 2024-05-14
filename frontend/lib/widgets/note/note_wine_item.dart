import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_label_widget.dart';

class NoteWineItem extends StatelessWidget {
  final NoteWine wine;
  final bool isSelected;

  const NoteWineItem({super.key, required this.wine, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => SearchDetailScreen(
                wineId: wine.id),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey,
              width: 1 // Dynamic border color // Set the border width
              ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        '${wine.imageUrl}',
                        width: 100,
                        height: 120,
                      ),
                    ),
                    // Positioned the WineLabel at the bottom center of the image
                    // Positioned(
                    //   bottom: 10,
                    //   child: WineLabel(type: '${wine.type}'),
                    // ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${wine.winery}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: AppFontSizes.mediumSmall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${wine.name}',
                        style: TextStyle(
                          fontSize: AppFontSizes.mediumSmall,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          NationFlag(
                            country: '${wine.country}',
                            height: 20,
                            width: 20,
                          ),
                          Text(
                            '${wine.country}',
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
