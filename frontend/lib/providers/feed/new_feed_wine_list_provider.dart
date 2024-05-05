import 'package:flutter/material.dart';
import 'package:frontend/models/wine_model.dart';

class NewFeedWineListProvider with ChangeNotifier {

  List<Wine> _wineList = [];

  List<Wine> get wineList => _wineList;

  void addWine(Wine wine) {
    _wineList.add(wine);
    notifyListeners();
  }

  void removeWine(Wine wine) {
    _wineList.remove(wine);
    notifyListeners();
  }
}