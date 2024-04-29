import 'package:frontend/models/user.dart';

class Feed {
  User user;
  String? imageUrl;
  String? content;
  DateTime createdTime;
  bool isPublic;
  int likeCount;

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

  @override
  String toString() {
    return 'Feed{user: $user, imageUrl: $imageUrl, content: $content, isPublic: $isPublic}';
  }
}
