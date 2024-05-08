import 'package:frontend/models/wine_model.dart';

class Bookmark {
  final int id;
  final Wine wine;

  Bookmark({required this.id, required this.wine});

  Bookmark.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        wine = Wine.fromJson(json['wine']);
}