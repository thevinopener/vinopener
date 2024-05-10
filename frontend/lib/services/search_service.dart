// lib/services/search_service.dart

import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:frontend/models/search/search_wine_name_result.dart';
import 'package:frontend/models/search/search_wine_type_result.dart';
import 'package:frontend/models/search/search_wine_detail.dart';
import 'package:frontend/models/search/search_history.dart';
import 'package:frontend/utils/api_client.dart';

class SearchService {
  // 와인명으로 조회 API
  static Future<List<WineNameResult>> findByWineName(String searchValue) async {
    // API 호출 시 검색어를 쿼리 파라미터로 전달
    final response = await ApiClient()
        .dio
        .get('/wines/search', queryParameters: {'query': searchValue});

    if (response.statusCode == 200) {
      // 응답 데이터로부터 리스트 생성
      List<dynamic> responseData = response.data;
      List<WineNameResult> wineList = responseData
          .map((wineData) => WineNameResult.fromJson(wineData))
          .toList();
      return wineList;
    }

    // 오류 발생 시 예외를 던짐
    throw Exception(':::: search_service.dart :::: findByWineName API 호출 실패');
  }

  // 와인타입 검색 API
  static Future<List<WineTypeResult>> findByWineType(String wineType) async {
    final response = await ApiClient().dio.get('/wines/types/${wineType}');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<WineTypeResult> wineList = responseData
          .map((wineData) => WineTypeResult.fromJson(wineData))
          .toList();
      print('wineList: ' + wineList.toString());
      return wineList;
    }

    throw Exception(':::: search_service.dart :::: findByWineType API 호출 실패');
  }

  // 와인 상세 조회 API
  static Future<WineDetail> findDetailByWineId(int wineId) async {
    try {
      // API 호출 시 와인 ID를 경로 변수로 전달
      final response = await ApiClient().dio.get('/wines/$wineId');

      if (response.statusCode == 200) {
        // 응답을 JSON에서 Wine 객체로 변환
        return WineDetail.fromJson(response.data);
      } else {
        // 비정상적인 상태 코드 처리
        throw Exception('Failed to load wine detail with ID: $wineId');
      }
    } on DioException catch (e) {
      // 네트워크 또는 기타 API 호출 관련 오류 처리
      print('\n\nDioException in search_service.dart: $e\n\n');
      throw Exception('findDetailByWineId API 호출 실패: ${e.message}\n\n');
    } catch (e) {
      // 다른 예외 처리
      print('findDetailByWineId API 호출 중 다른 예외 발생: $e\n\n');
      throw Exception('findDetailByWineId API 호출 중 다른 오류 발생\n\n');
    }
  }

  // 검색기록조회 API
  static Future<List<SearchHistory>> getHistory() async {
    try {
      // API 호출 시 와인 ID를 경로 변수로 전달
      final response = await ApiClient().dio.get('/searches');

      if (response.statusCode == 200) {
        List<dynamic> responseDate = response.data;
        List<SearchHistory> searchHistoryList = responseDate
            .map((historyData) => SearchHistory.fromJson(historyData))
            .toList();
        return searchHistoryList;
      } else {
        throw Exception(':::: search_service.dart :::: getHistory API 호출 실패');
      }
    } on DioException catch (e) {
      // 네트워크 또는 기타 API 호출 관련 오류 처리
      print('\n\nDioException in search_service.dart: $e\n\n');
      throw Exception('getHistory API 호출 실패: ${e.message}\n\n');
    } catch (e) {
      // 다른 예외 처리
      print('getHistory API 호출 중 다른 예외 발생: $e\n\n');
      throw Exception('getHistory API 호출 중 다른 오류 발생\n\n');
    }
  }

  // 단일 검색 기록 삭제 메서드
  static Future<void> deleteSearchHistoryById(int searchId) async {
    final endpoint = '/searches/each/$searchId';
    try {
      final response = await ApiClient().dio.delete(endpoint);
      if (response.statusCode != 204) {
        throw Exception(
            ':::: search_service.dart :::: deleteSearchHistoryById API 호출 실패');
      }
    } on DioException catch (e) {
      print('deleteSearchHistoryById API 호출 중 다른 예외 발생: $e');
      throw Exception(
          'deleteSearchHistoryById API 호출 중 다른 오류 발생: ${e.message}');
    }
  }

  // 전체 검색 기록 삭제 메서드
  static Future<void> deleteAllSearchHistory() async {
    final endpoint = '/searches/all';
    try {
      final response = await ApiClient().dio.delete(endpoint);
      if (response.statusCode != 204) {
        throw Exception(
            ':::: search_service.dart :::: deleteAllSearchHistory API 호출 실패');
      }
    } on DioException catch (e) {
      print('deleteAllSearchHistory API 호출 중 다른 예외 발생: $e');
      throw Exception('deleteAllSearchHistory API 호출 중 다른 오류 발생: ${e.message}');
    }
  }

  // 즐겨찾기 추가 메서드
  static Future<void> addBookmark(int wineId) async {
    // API 호출 시 검색어를 쿼리 파라미터로 전달
    final response = await ApiClient()
        .dio
        .post('/bookmarks',
      data: {
        'wineId': wineId, // JSON으로 보낼 데이터
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json', // 요청 헤더에 JSON 타입 지정
        },
      ),
    );
    if (response.statusCode == 201) return;

    // 오류 발생 시 예외를 던짐
    throw Exception(':::: search_service.dart :::: addBookmark API 호출 실패');
  }

  // 즐겨찾기 삭제 메서드
  static Future<void> removeBookmark(int wineId) async {
    final endpoint = '/bookmarks/delete/${wineId}';
    try {
      final response = await ApiClient().dio.delete(endpoint);
      if (response.statusCode != 204) {
        throw Exception(
            ':::: search_service.dart :::: removeBookmark API 호출 실패');
      }
    } on DioException catch (e) {
      print('removeBookmark API 호출 중 다른 예외 발생: $e');
      throw Exception('removeBookmark API 호출 중 다른 오류 발생: ${e.message}');
    }
  }

  // 셀러 추가 메서드
  static Future<void> addCellar(int wineId) async {
    // API 호출 시 검색어를 쿼리 파라미터로 전달
    final response = await ApiClient()
        .dio
        .post('/cellars',
      data: {
        'wineId': wineId,
        'finishedDate': null,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json', // 요청 헤더에 JSON 타입 지정
        },
      ),
    );
    if (response.statusCode == 201) return;

    // 오류 발생 시 예외를 던짐
    throw Exception(':::: search_service.dart :::: addCellar API 호출 실패');
  }

  // 셀러 삭제 메서드
  static Future<void> removeCellar(int wineId) async {
    final endpoint = '/cellars/delete/${wineId}';
    try {
      final response = await ApiClient().dio.delete(endpoint);
      if (response.statusCode != 204) {
        throw Exception(
            ':::: search_service.dart :::: removeCellar API 호출 실패');
      }
    } on DioException catch (e) {
      print('removeCellar API 호출 중 다른 예외 발생: $e');
      throw Exception('removeCellar API 호출 중 다른 오류 발생: ${e.message}');
    }
  }

}
