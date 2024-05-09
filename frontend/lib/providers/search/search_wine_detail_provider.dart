// lib/providers/search/search_wine_detail_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/search/wine_detail.dart';
import 'package:frontend/services/search_service.dart';

class SearchWineDetailProvider extends ChangeNotifier {
  WineDetail? _wineDetail; // 초기값을 null로 설정
  WineDetail? get wineDetail => _wineDetail;

  bool _isLoading = false;
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

  // 북마크 추가
  Future<void> addBookmark(int wineId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await SearchService.addBookmark(wineId);
      await findDetailByWineId(wineId);
    } catch (e) {
      print('북마크 추가에 실패했습니다. (search_wine_detail_provider.dart)');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 북마크 삭제
  Future<void> removeBookmark(int wineId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await SearchService.removeBookmark(wineId);
      await findDetailByWineId(wineId);
    } catch (e) {
      print('북마크 삭제에 실패했습니다. (search_wine_detail_provider.dart)');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 셀러 추가
  Future<void> addCellar(int wineId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await SearchService.addCellar(wineId);
      await findDetailByWineId(wineId);
    } catch (e) {
      print('셀러 추가에 실패했습니다. (search_wine_detail_provider.dart)');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 셀러 삭제
  Future<void> removeCellar(int wineId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await SearchService.removeCellar(wineId);
      await findDetailByWineId(wineId);
    } catch (e) {
      print('셀러 삭제에 실패했습니다. (search_wine_detail_provider.dart)');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
