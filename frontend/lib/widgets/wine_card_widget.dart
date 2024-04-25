import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';

class WineCard extends StatelessWidget {
  final Wine wine;

  const WineCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 200,
        height: 800,
        child: Column(
          children: [
            Image.network('https://picsum.photos/120/120'),
            Text(
              '${wine.winery}',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              '${wine.name}',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
