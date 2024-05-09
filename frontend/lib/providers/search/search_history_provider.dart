import 'package:flutter/material.dart';
import 'package:frontend/models/search/search_history.dart';
import 'package:frontend/services/search_service.dart';

class SearchHistoryProvider extends ChangeNotifier {
  List<SearchHistory> _historyList = [];
  bool _isLoading = false;

  List<SearchHistory> get historyList => _historyList;

  bool get isLoading => _isLoading;

  // 검색 기록을 로드하는 메서드
  Future<void> loadHistory() async {
    _isLoading = true;
    notifyListeners(); // 로딩 상태 업데이트

    try {
      _historyList = await SearchService.getHistory();
    } catch (e) {
      print(
          '\n\nSearchHistory를 가져오는데 실패했습니다. (search_wine_detail_provider.dart): $e\n\n');
      _historyList = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // 상태 업데이트
      print('\n\n\n\n\n\n??');
    }
  }

  // 단일 검색 기록을 삭제하는 메서드
  Future<void> deleteSearchHistoryById(int searchId) async {
    try {
      await SearchService.deleteSearchHistoryById(searchId);
      _historyList.removeWhere((history) => history.id == searchId);
      notifyListeners();
    } catch (e) {
      print(
          '\n\nsearchId ${searchId}번 삭제에 실패했습니다. (search_wine_detail_provider.dart): $e\n\n');
    }
  }

  // 전체 검색 기록을 삭제하는 메서드
  Future<void> deleteAllSearchHistory() async {
    try {
      await SearchService.deleteAllSearchHistory();
      _historyList.clear();
      notifyListeners();
    } catch (e) {
      print(
          '\n\n검색기록 전체삭제에 실패했습니다. (search_wine_detail_provider.dart): $e\n\n');
    }
  }
}
