// lib/services/search_service.dart

import 'package:dio/dio.dart';
import 'package:frontend/models/wine.dart';
import 'package:frontend/models/wine_detail.dart';
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
