import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final String defaultImageUrl = 'assets/default_wine.jpg';

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
            Container(
              width: 120,
              height: 120,
              child: Image.network(
                '${wine.imageUrl}',
                fit: BoxFit.scaleDown,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return Image.asset(defaultImageUrl, fit: BoxFit.scaleDown);
                },
              ),
            ),
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
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
