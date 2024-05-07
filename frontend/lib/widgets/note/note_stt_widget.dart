import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:frontend/constants/colors.dart';
import 'package:speech_to_text/speech_to_text.dart';


class SttWidget extends StatefulWidget {
  final int currentPage;
  final Function(int) onPageChangeRequest;

  const SttWidget({Key? key, required this.currentPage, required this.onPageChangeRequest}) : super(key: key);

  @override
  _SttWidgetState createState() => _SttWidgetState();
}


class _SttWidgetState extends State<SttWidget> {
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();  // TTS 인스턴스 생성
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _initTts();
    _currentPage = widget.currentPage;
  }

  void _initSpeech() async {
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
    });

    _flutterTts.setCompletionHandler(() {
      print("TTS Complete");
    });

    _flutterTts.setErrorHandler((msg) {
      print("TTS Error: $msg");
    });
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('STT Status: $status'),
        onError: (errorNotification) => print('STT Error: $errorNotification'),
      );
      if (!available) {
        setState(() => _isListening = false);
        print('The user has denied the use of speech recognition.');
        return;
      }
    }
    setState(() => _isListening = true);
    _speech.listen(
      onResult: (result) {
        setState(() {
          _text = result.recognizedWords;
        });
        if (result.recognizedWords.contains("다음")) {
          if (_currentPage < 3) {  // 마지막 페이지 전까지
            int nextPage = _currentPage + 1;
            widget.onPageChangeRequest(nextPage);
            setState(() {
              _currentPage = nextPage;  // 현재 페이지 업데이트
            });
          } else {  // 마지막 페이지인 경우
            _speak("마지막 항목입니다");
          }
        } else {
          _speak(result.recognizedWords);  // 다른 음성은 TTS로 처리
        }
      },
      localeId: 'ko-KR',
    );
  }

  void _speak(String text) async {
    if (text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1) print("TTS Success"); // Success
      else print("TTS Failed with code: $result"); // Check the failure
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _text,
              style: const TextStyle(fontSize: 24.0, color: AppColors.white),
            ),
          ),
          ElevatedButton(
            onPressed: _startListening,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
          Text(_currentPage.toString(), style: TextStyle(color: AppColors.white),),
        ],
      ),
    );
  }
}
