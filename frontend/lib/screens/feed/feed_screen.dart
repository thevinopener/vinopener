//
import 'package:frontend/constants/fonts.dart';

//
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
import 'package:provider/provider.dart';
//
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';

//
import 'package:frontend/widgets/feed/feed_item_widget.dart';

//
import 'package:frontend/screens/feed/feed_img_screen.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FeedTabState>(context, listen: false).setFeedList();
  }

  @override
  Widget build(BuildContext context) {
    void addFeed(BuildContext context) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => FeedImageScreen(),
        ),
      ).then((_) {
        setState(() {
          Provider.of<FeedTabState>(context, listen: false).setFeedList();
        });
      });
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
            onPressed: () => addFeed(context),
            icon: Icon(Icons.add),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      body: Consumer<FeedTabState>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.feedList.length,
            itemBuilder: (context, index) {
              if (provider.feedList[index].isPublic!) {
                return FeedItem(feed: provider.feedList[index]);
              }
            },
          );
        },
      ),
    );
  }
}
