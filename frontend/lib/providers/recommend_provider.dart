// recommend_provider.dart
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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRecommendWineList(String recommendType) async {
    _isLoading = true;
    notifyListeners();

    try {
      switch (recommendType) {
        case 'view':
          _viewRecommendWineList = await RecommendService.getViewRecommend();
          break;
        case 'preference':
          _preferenceRecommendWineList = await RecommendService.getPreferenceRecommend();
          break;
        case 'tasting-note':
          _tastingNoteRecommendWineList = await RecommendService.getTastingNoteRecommend();
          break;
        case 'cellar':
          _cellarRecommendWineList = await RecommendService.getCellarRecommend();
          break;
        case 'rate':
          _rateRecommendWineList = await RecommendService.getRateRecommend();
          break;
      }
    } catch (e) {
      switch (recommendType) {
        case 'view':
          _viewRecommendWineList = [];
          break;
        case 'preference':
          _preferenceRecommendWineList = [];
          break;
        case 'tasting-note':
          _tastingNoteRecommendWineList = [];
          break;
        case 'cellar':
          _cellarRecommendWineList = [];
          break;
        case 'rate':
          _rateRecommendWineList = [];
          break;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
