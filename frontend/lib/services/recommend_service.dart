// recommend_service.dart
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:frontend/utils/api_client.dart';
import 'package:frontend/models/recommend/recommend_wine_list.dart';

class RecommendService {
  // view
  static Future<List<RecommendWine>> getViewRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/view');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  // tasting-note
  static Future<List<RecommendWine>> getTastingNoteRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/tasting-note');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  // cellar
  static Future<List<RecommendWine>> getCellarRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/cellar');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  // preference
  static Future<List<RecommendWine>> getPreferenceRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/preference');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  // rate
  static Future<List<RecommendWine>> getRateRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/rate');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  // wineDetail 페이지 추천 -> 와인과 유사한 거
  static Future<List<RecommendWine>> getWineDetailRecommend() async {
    final response = await ApiClient().dio.get('/recommendations/wine-detail');

    if (response.statusCode == 200) {
      // 응답 데이터를 리스트로 변환
      List<dynamic> responseData = response.data;
      List<RecommendWine> wineList = responseData
          .map((wineData) => RecommendWine.fromJson(wineData))
          .toList();
      return wineList;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

}
