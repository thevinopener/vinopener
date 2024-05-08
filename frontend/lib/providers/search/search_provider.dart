// lib/providers/search/search_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/wine.dart';
import 'package:frontend/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  List<Wine> _wines = [];
  bool _isLoading = false;

  List<Wine> get wines => _wines;
  bool get isLoading => _isLoading;

  Future<void> searchWines(String query) async {
    _isLoading = true; // 로딩 상태를 시작
    notifyListeners(); // 상태 변경 알림

    try {
      // `SearchService`를 통해 검색 결과 가져오기
      _wines = await SearchService.findByWineName(query);
    } catch (e) {
      _wines = [];
      print('Error fetching wines: $e');
    } finally {
      _isLoading = false; // 로딩 완료
      notifyListeners(); // 상태 변경 알림
    }
  }
}
