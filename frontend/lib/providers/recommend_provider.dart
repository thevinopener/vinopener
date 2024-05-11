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

  // 와인 리스트 타입 향후 결정
  // List<> _usRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _itRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _frRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _chRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _arRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _spRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;
  //
  // List<> _auRecommendWineList = [];
  // List<> get usRecommendWineList => _usRecommendWineList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchAllRecommendations() async {
    _isLoading = true;
    notifyListeners();

    try {
      _viewRecommendWineList = await RecommendService.getViewRecommend();
      _preferenceRecommendWineList = await RecommendService.getPreferenceRecommend();
      _tastingNoteRecommendWineList = await RecommendService.getTastingNoteRecommend();
      _cellarRecommendWineList = await RecommendService.getCellarRecommend();
      _rateRecommendWineList = await RecommendService.getRateRecommend();
    } catch (e) {
      // 실패 시 모든 목록을 빈 상태로 설정
      _viewRecommendWineList = [];
      _preferenceRecommendWineList = [];
      _tastingNoteRecommendWineList = [];
      _cellarRecommendWineList = [];
      _rateRecommendWineList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
