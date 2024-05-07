import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:frontend/constants/colors.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
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
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  int _currentPage = 0;
  List<String> titles = ['색상', '향', '맛', '의견'];

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
    _initSpeech();
    _initTts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _promptUser();
    });
  }

  void _promptUser() async {
    if (_currentPage < titles.length) {
      var title = titles[_currentPage];
       _speak("$title은 어떠합니까?");
    }
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
      _startListening();
    });

    _flutterTts.setErrorHandler((msg) {
      print("TTS Error: $msg");
    });
  }

  void _startListening() {
    if (!_isListening) {
      _speech.initialize().then((available) {
        if (available) {
          setState(() => _isListening = true);
          _speech.listen(
              onResult: _handleResult,
              localeId: 'ko-KR'  // 여기에서 한국어 음성 인식 설정
          );
        } else {
          setState(() => _isListening = false);
          print('The user has denied the use of speech recognition.');
        }
      });
    } else {
      _speech.listen(
          onResult: _handleResult,
          localeId: 'ko-KR'  // 여기에서 한국어 음성 인식 설정
      );
    }

  }

  void _handleResult(SpeechRecognitionResult result) {
    setState(() {
      _text = result.recognizedWords;
    });
    _analyzeSpeech(result.recognizedWords);
  }

  void _analyzeSpeech(String text) {
    if (text.toLowerCase().contains("다음")) {
      if (_currentPage < titles.length - 1) {
        int nextPage = _currentPage + 1;
        widget.onPageChangeRequest(nextPage);
        setState(() {
          _currentPage = nextPage;
        });
        _promptUser();
      } else {
        _speak("마지막 항목입니다");
      }
    } else {
      _speak(text);
    }
  }

  void _speak(String text) async {
    if (text.isNotEmpty) {
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
          Text("현재 페이지: ${_currentPage + 1}", style: TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }
}
