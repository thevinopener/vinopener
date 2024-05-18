import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../constants/colors.dart';
import '../../models/ai_chat_model.dart';
import '../../providers/note/note_wine_provider.dart';
import '../../services/note_service.dart';

class SttWidget extends StatefulWidget {
  final int currentPage;
  final Function(int) onPageChangeRequest;

  const SttWidget({Key? key, required this.currentPage, required this.onPageChangeRequest}) : super(key: key);

  @override
  SttWidgetState createState() => SttWidgetState();
}

class SttWidgetState extends State<SttWidget> {
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  bool _isSpeaking = false;
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
      _updateQuestionText();
      _promptUser();
    });
  }

  void _updateQuestionText() {
    setState(() {
      _questionText = "${titles[_currentPage]}은 어떠합니까?";
    });
  }

  void _promptUser() async {
    await _speak(_questionText);
  }

  void _initSpeech() async {
    bool available = await _speech.initialize(onStatus: _onSpeechStatus, onError: _onSpeechError);
    if (!mounted) return;
    setState(() {
      _isListening = available;
    });
  }

  void _onSpeechStatus(String status) {
    print('STT Status: $status');
    setState(() {
      _isListening = status == "listening";
    });
  }

  void _onSpeechError(SpeechRecognitionError error) {
    setState(() {
      _questionText = error.errorMsg == "error_speech_timeout" && error.permanent
          ? "다시 말씀해주세요."
          : "오류가 발생했습니다. 다시 시도해 주세요.";
    });
    _promptUser();
  }

  void _initTts() {
    _flutterTts.setLanguage('ko-KR');
    _flutterTts.setPitch(1.0);
    _flutterTts.setStartHandler(() {
      print("TTS Start");
      setState(() {
        _isSpeaking = true;
      });
      if (_isListening) {
        _speech.stop();
      }
    });

    _flutterTts.setCompletionHandler(() {
      print("TTS Complete");
      setState(() {
        _isSpeaking = false;
      });
      _startListening();
    });

    _flutterTts.setErrorHandler((msg) {
      print("TTS Error: $msg");
    });
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      _questionText = text;
      await _flutterTts.speak(text);
    }
  }

  void _startListening() {
    _speech.initialize().then((available) {
      setState(() => _isListening = available);
      if (available) {
        _speech.listen(
          onResult: _handleResult,
          localeId: 'ko-KR',
          listenFor: Duration(seconds: 10),
          pauseFor: Duration(seconds: 5),
        );
      } else {
        setState(() => _isListening = false);
        print('The user has denied the use of speech recognition.');
      }
    });
  }

  void _handleResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      setState(() {
        _answerText = result.recognizedWords;
      });
      _analyzeSpeech(result.recognizedWords);
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
    AiChatService.postAiChat(aiChat).then((AiAnswer aiAnswer) {
      noteId = aiAnswer.id;
      noteProvider.updateNoteProvider(
        colorId: aiAnswer.newState.color.id,
        flavourTasteIds: aiAnswer.newState.flavours.isNotEmpty
            ? aiAnswer.newState.flavours.map((f) => f.id).toList()
            : noteProvider.flavourTasteIds,
        sweetness: aiAnswer.newState.sweetness ?? noteProvider.sweetness,
        intensity: aiAnswer.newState.intensity ?? noteProvider.intensity,
        acidity: aiAnswer.newState.acidity ?? noteProvider.acidity,
        alcohol: aiAnswer.newState.alcohol ?? noteProvider.alcohol,
        tannin: aiAnswer.newState.tannin ?? noteProvider.tannin,
        opinion: aiAnswer.newState.opinion ?? noteProvider.opinion,
        rating: aiAnswer.newState.rating ?? noteProvider.rating,
      );

      _speak(aiAnswer.message);
      _navigateToSection(aiAnswer.section);
    }).catchError((error) {
      setState(() {
        _questionText = error.toString().contains("COLOR_NOT_FOUND")
            ? "입력하신 색상을 찾을 수 없습니다. 다시 입력해 주세요."
            : "오류가 발생했습니다. 다시 시도해 주세요.";
      });
      _promptUser();
    });
  }

  void _navigateToSection(String section) {
    Map<String, int> sectionToPage = {
      'COLOR': 0,
      'FLAVOUR': 1,
      'SWEETNESS': 2,
      'INTENSITY': 2,
      'ACIDITY': 2,
      'ALCOHOL': 2,
      'TANNIN': 2,
      'OPINION': 3,
      'RATING': 3, // OPINION과 RATING은 같은 페이지에 표시
      'COMPLETE': 4,
      'EXIT': 5 // EXIT는 앱을 종료하거나 초기 화면으로 돌아가는 조건
    };

    int? nextPage = sectionToPage[section];
    if (nextPage != null) {
      if (nextPage == 4) {
        postNote();
      } else if (nextPage == 5) {
        Navigator.of(context).pop();
      } else {
        widget.onPageChangeRequest(nextPage);
        setState(() {
          _currentPage = nextPage;
          _updateQuestionText();
          _promptUser();
        });
      }
    } else {
      _speak("섹션을 찾을 수 없습니다.");
      _promptUser();
    }
  }

  Future<void> postNote() async {
    try {
      final wineId = Provider.of<NoteWineProvider>(context, listen: false).getWine().id;
      final noteProvider = Provider.of<NoteProvider>(context, listen: false);
      noteProvider.updateNoteProvider(wineId: wineId);

      await NoteService.createNote(noteProvider);

      noteProvider.reset();
      Future.delayed(
        Duration(seconds: 3),
            () {
              Navigator.popUntil(context, (route) => route.isFirst);
        },
      );

    } catch (e) {
      print("Error posting note: $e");
    }
  }

  void stopTtsAndStt() {
    _flutterTts.stop();
    _speech.stop();
    setState(() {
      _isListening = false;
      _isSpeaking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF14131C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              _questionText,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  (_isListening && !_isSpeaking)
                      ? "assets/images/voice.gif" // 마이크가 활성화되고 TTS가 말하지 않으면 voice.gif 표시
                      : "assets/images/quiet.png", // 기본은 quiet.png
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: Text(
              _answerText,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
