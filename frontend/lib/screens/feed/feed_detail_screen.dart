import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/feed_model.dart';
import 'package:frontend/widgets/common/templates/feed_widget.dart';

class FeedDetailScreen extends StatelessWidget {
  const FeedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feed Detail')),
      body: Feed(
        feedModel: FeedModel.dummy(),
      ),
    );
  }
}
