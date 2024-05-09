// lib/providers/search/search_wine_detail_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/search/wine_detail.dart';
import 'package:frontend/services/search_service.dart';

class SearchWineDetailProvider extends ChangeNotifier {
  WineDetail? _wineDetail; // 초기값을 null로 설정
  bool _isLoading = false;

  WineDetail? get wineDetail => _wineDetail;
  bool get isLoading => _isLoading;

  Future<void> findDetailByWineId(int wineId) async {
    _isLoading = true; // 로딩 상태를 시작
    notifyListeners(); // 상태 변경 알림

    try {
      // `SearchService`를 통해 검색 결과 가져오기
      _wineDetail = await SearchService.findDetailByWineId(wineId);
    } catch (e) {
      _wineDetail = null; // 오류 시 null로 초기화
      print('wineDetail을 가져오는데 실패했습니다. (search_wine_detail_provider.dart): $e');
    } finally {
      _isLoading = false; // 로딩 완료
      notifyListeners(); // 상태 변경 알림
    }
  }
}
