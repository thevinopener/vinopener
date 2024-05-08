// lib/providers/search/search_wine_list_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/wine.dart';
import 'package:frontend/services/search_service.dart';

class SearchWineListProvider extends ChangeNotifier {
  List<Wine> _wineList = [];
  bool _isLoading = false;

  List<Wine> get wineList => _wineList;
  bool get isLoading => _isLoading;

  Future<void> findByWineName(String query) async {
    _isLoading = true; // 로딩 상태를 시작
    notifyListeners(); // 상태 변경 알림

    try {
      // `SearchService`를 통해 검색 결과 가져오기
      _wineList = await SearchService.findByWineName(query);
    } catch (e) {
      _wineList = [];
      print('wineList를 가져오는데 실패했습니다. (search_wine_list_provider.dart): $e');
    } finally {
      _isLoading = false; // 로딩 완료
      notifyListeners(); // 상태 변경 알림
    }
  }
}
