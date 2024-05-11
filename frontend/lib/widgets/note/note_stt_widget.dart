import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/ai_chat_model.dart';
import 'package:frontend/services/note_service.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../providers/note/note_wine_provider.dart';

class SttWidget extends StatefulWidget {
  final int currentPage;
  final Function(int) onPageChangeRequest;

  const SttWidget(
      {Key? key, required this.currentPage, required this.onPageChangeRequest})
      : super(key: key);

  @override
  _SttWidgetState createState() => _SttWidgetState();
}

class _SttWidgetState extends State<SttWidget> {
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  int _currentPage = 0;
  List<String> titles = ['색상', '향', '맛', '의견'];
  String _questionText = '';
  String _answerText = '';
  int? noteId = null;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
    _initSpeech();
    _initTts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _promptUser();
    });
    _updateQuestionText();
  }

  void _updateQuestionText() {
    // 질문을 업데이트하는 로직
    _questionText = "${titles[_currentPage]}은 어떠합니까?";
  }

  void _promptUser() async {
    // 사용자에게 질문하는 로직
    _speak(_questionText);
  }

  void _initSpeech() async {
    // STT 초기화
    bool available = await _speech.initialize(
      onStatus: (status) => print('STT Status: $status'),
      onError: (errorNotification) => print('STT Error: $errorNotification'),
    );
    if (!mounted) return;
    setState(() {
      _isListening = available;
    });
  }

  void _initTts() {
    _flutterTts.setLanguage('ko-KR');
    _flutterTts.setPitch(1.0);

    _flutterTts.setStartHandler(() {
      print("TTS Start");
      if (_isListening) {
        _speech.stop(); // TTS가 시작하기 전에 STT가 활성화된 경우, STT를 중지합니다.
      }
    });

    _flutterTts.setCompletionHandler(() {
      print("TTS Complete");
      _startListening(); // TTS 재생이 끝나면 STT를 시작합니다.
    });

    _flutterTts.setErrorHandler((msg) {
      print("TTS Error: $msg");
    });
  }

  void _startListening() {
    _speech.initialize().then((available) {
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: _handleResult,
          localeId: 'ko-KR', // 한국어 음성 인식 설정
          listenFor: Duration(seconds: 30), // 최대 30초 동안 듣기
          pauseFor: Duration(seconds: 5), // 사용자가 5초 동안 말하지 않으면 자동으로 중지
        );
      } else {
        setState(() => _isListening = false);
        print('The user has denied the use of speech recognition.');
      }
    }).catchError((e) {
      print("Error initializing speech recognizer: $e");
      setState(() => _isListening = false);
    });
  }

  void _handleResult(SpeechRecognitionResult result) {
    if (result.finalResult) { // 최종 인식 결과만 처리
      setState(() {
        _answerText = result.recognizedWords; // 사용자의 말을 텍스트로 저장
      });
      _analyzeSpeech(result.recognizedWords);
      _speech.stop(); // 음성 인식 종료
      setState(() => _isListening = false);
    }
  }

  void _analyzeSpeech(String text) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    NoteState noteState = NoteState(
      tastingNoteId: noteId,
      wineId: noteProvider.wineId,
      colorId: noteProvider.colorId,
      flavourTasteIds: noteProvider.flavourTasteIds,
      sweetness: noteProvider.sweetness,
      intensity: noteProvider.intensity,
      acidity: noteProvider.acidity,
      alcohol: noteProvider.alcohol,
      tannin: noteProvider.tannin,
      opinion: noteProvider.opinion,
      rating: noteProvider.rating,
    );
    AiChat aiChat = AiChat(state: noteState, message: text);

    AiChatService.postSurvey(aiChat).then((AiAnswer aiAnswer) {
      noteId = aiAnswer.id;
      noteProvider.updateNoteProvider(
        colorId: aiAnswer.newState.color?.id ?? noteProvider.colorId,
        flavourTasteIds: aiAnswer.newState.flavours.isNotEmpty ? aiAnswer.newState.flavours.map((f) => f.id).toList() : noteProvider.flavourTasteIds,
        sweetness: aiAnswer.newState.sweetness ?? noteProvider.sweetness,
        intensity: aiAnswer.newState.intensity ?? noteProvider.intensity,
        acidity: aiAnswer.newState.acidity ?? noteProvider.acidity,
        alcohol: aiAnswer.newState.alcohol ?? noteProvider.alcohol,
        tannin: aiAnswer.newState.tannin ?? noteProvider.tannin,
        opinion: aiAnswer.newState.opinion ?? noteProvider.opinion,
        rating: aiAnswer.newState.rating ?? noteProvider.rating,
      );
      _navigateToSection(aiAnswer.section);
      _speak(aiAnswer.message);
    }).catchError((error) {
      print("Error posting survey: " + error.toString());
      if (error.toString().contains("COLOR_NOT_FOUND")) {
        _questionText = "입력하신 색상을 찾을 수 없습니다. 다시 입력해 주세요.";
        _speak("입력하신 색상을 찾을 수 없습니다. 다시 입력해 주세요.");
        _promptUser(); // 사용자로부터 다시 입력 받습니다.
      } else {
        _questionText = "오류가 발생했습니다. 다시 시도해 주세요.";
        _speak("오류가 발생했습니다. 다시 시도해 주세요.");
      }
    });
  }


  void _navigateToSection(String section) {
    Map<String, int> sectionToPage = {
      'COLOR': 0,
      'FLAVOUR': 1,
      'STRUCTURE': 2,
      'OPINION': 3,
      'RATING': 3  // OPINION과 RATING은 같은 페이지에 표시한다고 가정
    };

    int? nextPage = sectionToPage[section];
    if (nextPage != null) {
      if (_currentPage != nextPage) {
        widget.onPageChangeRequest(nextPage);
        setState(() {
          _currentPage = nextPage;
        });
        _updateQuestionText();
        _promptUser();
      }
    } else {
      _speak("섹션을 찾을 수 없습니다.");
    }
  }




  void _speak(String text) async {
    // 말하기 로직
    if (text.isNotEmpty) {
      _questionText= text;
      var result = await _flutterTts.speak(text);
      if (result == 1) {
        print("TTS Success");
      } else {
        print("TTS Failed with code: $result");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // UI 구성
    return Container(
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _questionText,
              style: const TextStyle(fontSize: 24.0, color: AppColors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _answerText,
              style: const TextStyle(fontSize: 24.0, color: AppColors.white),
            ),
          ),
          Text("현재 페이지: ${_currentPage + 1}",
              style: TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }
}
