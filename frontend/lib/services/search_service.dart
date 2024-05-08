// lib/services/search_service.dart
import 'dart:ffi';

import 'package:frontend/models/wine.dart';
import 'package:frontend/utils/api_client.dart';

class SearchService {

  // 와인명으로 조회 API
  static Future<List<Wine>> findByWineName(String searchValue) async {
    // API 호출 시 검색어를 쿼리 파라미터로 전달
    final response = await ApiClient().dio.get('/wines/search', queryParameters: {'query': searchValue});

    if (response.statusCode == 200) {
      // 응답 데이터로부터 리스트 생성
      List<dynamic> responseData = response.data;
      List<Wine> wineList = responseData.map((wineData) => Wine.fromJson(wineData)).toList();
      return wineList;
    }

    // 오류 발생 시 예외를 던짐
    throw Exception(':::: search_service.dart :::: findByWineName API 호출 실패');
  }

  // 와인타입 검색 API
  // static Future<List<Wine>> findByWineType(String wineType) async {
  //
  // throw Exception(':::: search_service.dart :::: findByWineType API 호출 실패');
  // }

  // 와인상세조회 API
  // static Future<Wine> findDetailByWineId(Long wineId) async {
  //
  // throw Exception(':::: search_service.dart :::: fineDetailByWineId API 호출 실패');
  // }

  // 검색기록조회 API
  // static Future<List<SearchHistories>> getHistory() async {
  //   throw Exception(':::: search_service.dart :::: getHistory API 호출 실패');
  // }

  // 검색기록 단일삭제 API
  // DeleteHistory

  // 검색기록 전체삭제 API
  // static Future<List>
  // DeleteAllHistory
}
