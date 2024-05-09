import 'package:frontend/models/ai_chat_model.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';
import 'package:frontend/utils/api_client.dart';

import '../models/note_model.dart';

class AiChatService {
  static Future<dynamic> postSurvey(AiChat aiChat) async {
    final response = await ApiClient().dio.post('/ai-chat', data: aiChat);
    if (response.statusCode == 200) {
      return response.statusCode;
    }
    throw Error();
  }
}

class NoteListService {
  static Future<List<WineNoteCard>> getNoteList() async {
    try {
      final response = await ApiClient().dio.get('/tasting-notes');
      if (response.statusCode == 200) {
        List<dynamic> noteJsonList = response.data as List;
        List<WineNoteCard> notes =
            noteJsonList.map((json) => WineNoteCard.fromJson(json)).toList();
        return notes;
      } else {
        throw Exception("Failed to load wine notes");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching data: $e");
    }
  }
}

class NoteDetailService {
  static Future<NoteDetailModel> getNoteDetail(int id) async {
    try {
      final response = await ApiClient().dio.get('/tasting-notes/$id');
      if (response.statusCode == 200) {
        // 응답 데이터를 NoteDetail 객체로 변환
        return NoteDetailModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load wine notes");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching data: $e");
    }
  }
}

class NoteCreateService {
  static Future<void> createNote(NoteProvider noteProvider) async {
    try {
      // NoteProvider 인스턴스의 데이터를 JSON으로 변환
      var jsonData = noteProvider.toJson();
      final response =
          await ApiClient().dio.post('/tasting-notes', data: jsonData);
      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버에 저장됨
        print("Note successfully created.");
      } else {
        // 서버 응답이 성공적이지 않을 경우
        throw Exception("Failed to create note: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while creating the note: $e");
    }
  }
}
