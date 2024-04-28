import 'package:flutter/material.dart';
import 'package:frontend/models/wine_model.dart';

class WineDetailScreen extends StatelessWidget {
  final Wine wine;

  const WineDetailScreen({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.navigate_before),
          ),
          title: Text('Wine Detail'),
        ),
        body: Column(
          children: [
            Text('${wine.name}'),
            Text('${wine.winery}'),
            Text('${wine.country}'),
          ],
        ));
  }
}
