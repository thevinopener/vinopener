import 'package:flutter/material.dart';
import 'package:frontend/models/wine_model.dart';

class NewFeedWineListProvider with ChangeNotifier {

  List<Wine> _wineList = [];

  List<Wine> get wineList => _wineList;

  List<Wine> getWineList() {
    return _wineList;
  }

  void setWineList(List<Wine> wineList) {
    _wineList = wineList;
    notifyListeners();
  }

  void clearWineList() {
    _wineList = [];
    notifyListeners();
  }
}