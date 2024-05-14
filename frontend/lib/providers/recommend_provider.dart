import 'package:flutter/foundation.dart';
import 'package:frontend/services/recommend_service.dart';
import 'package:frontend/models/recommend/recommend_wine_list.dart';

class RecommendProvider with ChangeNotifier {
  List<RecommendWine> _viewRecommendWineList = [];
  List<RecommendWine> get viewRecommendWineList => _viewRecommendWineList;

  List<RecommendWine> _preferenceRecommendWineList = [];
  List<RecommendWine> get preferenceRecommendWineList => _preferenceRecommendWineList;

  List<RecommendWine> _tastingNoteRecommendWineList = [];
  List<RecommendWine> get tastingNoteRecommendWineList => _tastingNoteRecommendWineList;

  List<RecommendWine> _cellarRecommendWineList = [];
  List<RecommendWine> get cellarRecommendWineList => _cellarRecommendWineList;

  List<RecommendWine> _rateRecommendWineList = [];
  List<RecommendWine> get rateRecommendWineList => _rateRecommendWineList;

  List<RecommendWine> _wineDetailRecommendWineList = [];
  List<RecommendWine> get wineDetailRecommendWineList => _wineDetailRecommendWineList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchViewRecommendations() async {
    _isLoading = true;
    notifyListeners();
    try {
      _viewRecommendWineList = await RecommendService.getViewRecommend();
    } catch (e) {
      _viewRecommendWineList = [];
      print('Error fetching view recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPreferenceRecommendations() async {
    _isLoading = true;
    notifyListeners();
    try {
      _preferenceRecommendWineList = await RecommendService.getPreferenceRecommend();
    } catch (e) {
      _preferenceRecommendWineList = [];
      print('Error fetching preference recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTastingNoteRecommendations() async {
    _isLoading = true;
    notifyListeners();
    try {
      _tastingNoteRecommendWineList = await RecommendService.getTastingNoteRecommend();
    } catch (e) {
      _tastingNoteRecommendWineList = [];
      print('Error fetching tasting note recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCellarRecommendations() async {
    _isLoading = true;
    notifyListeners();
    try {
      _cellarRecommendWineList = await RecommendService.getCellarRecommend();
    } catch (e) {
      _cellarRecommendWineList = [];
      print('Error fetching cellar recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRateRecommendations() async {
    _isLoading = true;
    notifyListeners();
    try {
      _rateRecommendWineList = await RecommendService.getRateRecommend();
    } catch (e) {
      _rateRecommendWineList = [];
      print('Error fetching rate recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWineDetailRecommendations(int wineId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _wineDetailRecommendWineList = await RecommendService.getWineDetailRecommend(wineId);
    } catch (e) {
      _wineDetailRecommendWineList = [];
      print('Error fetching rate recommendations: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 전체 로딩 상태를 확인하기 위한 헬퍼 함수
  void checkOverallLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
