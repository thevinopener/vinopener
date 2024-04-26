import 'package:flutter/material.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/widgets/atoms/nation_flag_widget.dart';

class WineItem extends StatelessWidget {
  final Wine wine;

  const WineItem({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 100,
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/wine.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${wine.winery}'),
                      Text(
                        '${wine.name}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NationFlag(height: 20, width: 20),
                      SizedBox(width: 5),
                      Text('${wine.country}')
                    ],
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
