import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/feed_model.dart';
import 'package:frontend/screens/feed/feed_img_screen.dart';
import 'package:frontend/widgets/common/templates/feed_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void addFeed() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedImageScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Feed',
            style: TextStyle(
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: addFeed,
              icon: Icon(Icons.add),
            )
          ],
          shape: Border(bottom: BorderSide(color: Colors.grey))),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(height: 20),
              Feed(
                feedModel: FeedModel.dummy(),
              ),
            ],
          );
        },
      ),
    );
  }
}
