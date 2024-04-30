import 'package:frontend/models/user.dart';
import 'package:frontend/models/wine_model.dart';

class Feed {
  User user;
  DateTime createdTime;
  String? imageUrl;
  int likeCount;
  List<Wine>? wineList;
  String? content;
  bool isPublic;

  Feed({required this.user, required this.imageUrl, required this.content, required this.isPublic, required this.likeCount, required this.createdTime});

  static Feed dummy() {
    return Feed(
      user: User.dummy(),
      imageUrl: 'assets/images/wine.jpg',
      content: '샤브샤브',
      isPublic: true,
      likeCount: 12,
      createdTime: DateTime.now(),
    );
  }

  static Feed test() {
    return Feed(
      user: User.dummy(),
      imageUrl: 'assets/images/wine.jpg',
      content: '샤브샤브',
      isPublic: true,
      likeCount: 12,
      createdTime: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Feed{user: $user, createdTime: $createdTime, imageUrl: $imageUrl, likeCount: $likeCount, wineList: $wineList, content: $content, isPublic: $isPublic}';
  }
}
