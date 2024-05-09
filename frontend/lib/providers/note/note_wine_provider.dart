import 'package:flutter/foundation.dart';
import 'package:frontend/models/wine_model.dart';

class NoteWineProvider with ChangeNotifier {
  Wine wine = Wine.dummy();

  void setWine(Wine wine) {
    this.wine = wine;
    notifyListeners();
  }

  Wine getWine() {
    return wine;
  }
}