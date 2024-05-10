// lib/providers/search/search_wine_list_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/search/search_wine_name_result.dart';
import 'package:frontend/models/search/search_wine_type_result.dart';
import 'package:frontend/services/search_service.dart';

String getWineType(String wineType) {
  switch (wineType) {
    case "레드":
      return "RED";
    case "로제":
      return "ROSE";
    case "화이트":
      return "WHITE";
    case "스파클링":
      return "SPARKLING";
    default:
      return "";
  }
}

class SearchWineListProvider extends ChangeNotifier {
  List<WineNameResult> _wineNameResultList = [];
  List<WineTypeResult> _wineTypeResultList = [];
  bool _isLoading = false;

  List<WineNameResult> get wineNameList => _wineNameResultList;

  List<WineTypeResult> get wineTypeList => _wineTypeResultList;

  bool get isLoading => _isLoading;

  Future<void> findByWineName(String query) async {
    _isLoading = true; // 로딩 상태를 시작
    notifyListeners(); // 상태 변경 알림

    try {
      // `SearchService`를 통해 검색 결과 가져오기
      _wineNameResultList = await SearchService.findByWineName(query);
    } catch (e) {
      _wineNameResultList = [];
      print(
          'wineNameResultList를 가져오는데 실패했습니다. (search_wine_list_provider.dart): $e');
    } finally {
      _isLoading = false; // 로딩 완료
      notifyListeners(); // 상태 변경 알림
    }
  }

  Future<void> findByWineType(String wineType) async {
    _isLoading = true;
    notifyListeners();

    try {
      print(wineType);
      _wineTypeResultList = await SearchService.findByWineType(getWineType(wineType));
    } catch (e) {
      _wineTypeResultList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
