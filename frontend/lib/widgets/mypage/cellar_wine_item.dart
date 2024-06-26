import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/cellar/cellar.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/widgets/common/atoms/nation_flag_widget.dart';
import 'package:frontend/widgets/common/atoms/wine_label_widget.dart';

class CellarWineItem extends StatelessWidget {
  final Cellar cellar;

  const CellarWineItem({super.key, required this.cellar});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Stack(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                // Ensure label is centered at the bottom of the image
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                      '${cellar.wine.imageUrl}',
                      width: 100,
                      height: 120,
                    ),
                  ),
                  // Positioned the WineLabel at the bottom center of the image
                  Positioned(
                    bottom: 10,
                    child: WineLabel(type: '${cellar.wine.type}'),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cellar.wine.winery}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: AppFontSizes.mediumSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${cellar.wine.name}',
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
                          country: '${cellar.wine.country}',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${cellar.wine.country}',
                          style: TextStyle(
                            fontSize: AppFontSizes.mediumSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          if (cellar.toalNotes > 0)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.bookmark,
                color: AppColors.primary,
              ),
            )
        ],
      ),
    );
  }
}
