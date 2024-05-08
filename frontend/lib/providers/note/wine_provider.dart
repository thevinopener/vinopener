import 'package:flutter/material.dart';

class Note with ChangeNotifier {
  int wineId;
  int colorId;
  List<int> flavourTasteIds;
  double sweetness;
  double intensity;
  double acidity;
  double alcohol;
  double tannin;
  String opinion;
  double rating;

  Note({
    this.wineId = 0,
    this.colorId = 0,
    this.flavourTasteIds= const [],
    this.sweetness = 0.0,
    this.intensity = 0.0,
    this.acidity = 0.0,
    this.alcohol = 0.0,
    this.tannin = 0.0,
    this.opinion = '',
    this.rating = 0.0,
  });

  void updateNote({
    int? wineId,
    int? colorId,
    List<int>? flavourTasteIds,
    double? sweetness,
    double? intensity,
    double? acidity,
    double? alcohol,
    double? tannin,
    String? opinion,
    double? rating,
  }) {
    if (wineId != null) this.wineId = wineId;
    if (colorId != null) this.colorId = colorId;
    if (flavourTasteIds != null) this.flavourTasteIds = flavourTasteIds;
    if (sweetness != null) this.sweetness = sweetness;
    if (intensity != null) this.intensity = intensity;
    if (acidity != null) this.acidity = acidity;
    if (alcohol != null) this.alcohol = alcohol;
    if (tannin != null) this.tannin = tannin;
    if (opinion != null) this.opinion = opinion;
    if (rating != null) this.rating = rating;

    notifyListeners();  // Notify all listening widgets of changes
  }
}
