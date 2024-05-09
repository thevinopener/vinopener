import 'package:flutter/cupertino.dart';

class NoteProvider with ChangeNotifier {
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

  NoteProvider({
    this.wineId = 0,
    this.colorId = 0,
    List<int>? flavourTasteIds,
    this.sweetness = 0.0,
    this.intensity = 0.0,
    this.acidity = 0.0,
    this.alcohol = 0.0,
    this.tannin = 0.0,
    this.opinion = '',
    this.rating = 0.0,
  }) : this.flavourTasteIds = flavourTasteIds != null ? List<int>.from(flavourTasteIds) : <int>[];

  void updateNoteProvider({
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
    if (flavourTasteIds != null) this.flavourTasteIds = List<int>.from(flavourTasteIds);
    if (sweetness != null) this.sweetness = sweetness;
    if (intensity != null) this.intensity = intensity;
    if (acidity != null) this.acidity = acidity;
    if (alcohol != null) this.alcohol = alcohol;
    if (tannin != null) this.tannin = tannin;
    if (opinion != null) this.opinion = opinion;
    if (rating != null) this.rating = rating;

    notifyListeners();
  }

  void addFlavourId(int id) {
    if (!flavourTasteIds.contains(id)) {
      flavourTasteIds.add(id);
      notifyListeners();
    }
  }

  void removeFlavourId(int id) {
    if (flavourTasteIds.contains(id)) {
      flavourTasteIds.remove(id);
      notifyListeners();
    }
  }

  void reset() {
    wineId = 0;
    colorId = 0;
    flavourTasteIds.clear();
    sweetness = 0.0;
    intensity = 0.0;
    acidity = 0.0;
    alcohol = 0.0;
    tannin = 0.0;
    opinion = '';
    rating = 0.0;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'wineId': wineId,
      'colorId': colorId,
      'flavourTasteIds': flavourTasteIds,
      'sweetness': sweetness,
      'intensity': intensity,
      'acidity': acidity,
      'alcohol': alcohol,
      'tannin': tannin,
      'opinion': opinion,
      'rating': rating,
    };
  }
}
