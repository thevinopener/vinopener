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

  Feed({required this.user, required this.imageUrl, required this.content, required this.isPublic, required this.likeCount, required this.createdTime, this.wineList});

  static Feed dummy() {
    List<Wine> wineList = [];
    for (int i = 0; i < 3; i++) {
      wineList.add(Wine.dummy());
    }
    return Feed(
      user: User.dummy(),
      imageUrl: 'https://picsum.photos/200/300',
      content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      isPublic: true,
      likeCount: 12,
      createdTime: DateTime(1995, 9, 27),
      wineList: wineList,
    );
  }

  @override
  String toString() {
    return 'Feed{user: $user, createdTime: $createdTime, imageUrl: $imageUrl, likeCount: $likeCount, wineList: $wineList, content: $content, isPublic: $isPublic}';
  }
}
