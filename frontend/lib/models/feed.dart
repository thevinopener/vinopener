import 'package:frontend/models/user.dart';
import 'package:frontend/models/wine_model.dart';

class Feed {
  int id;
  UserModel? user;
  DateTime? createdTime;
  String? imageUrl;
  bool? isLiked;
  int? likeCount;
  List<Wine>? wineList;
  String? content;
  bool? isPublic;

  Feed({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.content,
    required this.isPublic,
    required this.likeCount,
    required this.createdTime,
    this.wineList,
  });

  Feed.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user = UserModel(
          imageUrl: json['creator']['imageUrl'],
          nickname: json['creator']['nickname'],
        ),
        createdTime = DateTime.parse(json['createdTime']),
        imageUrl = json['imageUrl'],
        isLiked = json['myLike'],
        likeCount = json['totalLikes'],
        wineList = (json['wines'] as List<dynamic>?)
            ?.map((wineJson) => Wine.fromJson(wineJson))
            .toList(),
        content = json['content'],
        isPublic = json['isPublic'];
}
