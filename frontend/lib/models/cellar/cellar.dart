import 'package:frontend/models/wine_model.dart';

class Cellar {
  final int id;
  final String? finishedDate;
  final int toalNotes;
  final Wine wine;

  Cellar(
      {required this.id,
      required this.finishedDate,
      required this.toalNotes,
      required this.wine});

  Cellar.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        finishedDate = json['finishedDate'],
        toalNotes = json['totalNotes'],
        wine = Wine.fromJson(json['wine']);
}
