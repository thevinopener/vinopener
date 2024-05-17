// flutter
import 'dart:async';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_area_ocr_flutter/focused_area_ocr_flutter.dart';

// constants
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

// screen
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/recommend/recommend_screen.dart';
import 'package:frontend/screens/search/search_camera_bottom_screen.dart';
import 'package:frontend/screens/search/search_result_screen.dart';
import 'package:frontend/screens/wine/wine_search_screen.dart';

// package
import 'package:scanner_overlay/scanner_overlay.dart';

class SearchCameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const SearchCameraScreen({super.key, required this.camera});

  @override
  State<SearchCameraScreen> createState() => _SearchCameraScreenState();
}

class _SearchCameraScreenState extends State<SearchCameraScreen> {

  DateTime? lastPressedTime;
  final StreamController<String> controller = StreamController<String>();
  final double _textViewHeight = 80.0;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String recognizedText = '';

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium,
        enableAudio: false);
    _initializeControllerFuture = _controller.initialize().then((_) {
      if (mounted) {
        _controller.setFlashMode(FlashMode.off);
      }
    });

    controller.stream.listen((text) {
      setState(() {
        recognizedText = text;
      });
    });
  }

  void handleBackPress(BuildContext context) {
    final now = DateTime.now();
    if (lastPressedTime == null ||
        now.difference(lastPressedTime!) > Duration(seconds: 2)) {
      lastPressedTime = now;
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            padding: EdgeInsets.all(6),
            backgroundColor: Colors.black87,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/images/vinopener_logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                Text(
                  '  종료하려면 뒤로 가기를 다시 눌러주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppFontSizes.mediumSmall,

                  ),
                ),
              ],
            ),
            duration: Duration(seconds: 2),
          ),
        );
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.close();
    super.dispose();
  }

  Future<void> _showCameraBottomSheet(BuildContext context, {required String recognizedText}) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => CameraBottomSheetView(recognizedText: recognizedText),

    );
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          handleBackPress(context);
        }
      },
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    // OCR 카메라 프리뷰
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: FocusedAreaOCRView(
                        onScanText: (text) {
                          // OCR 인식된 텍스트 추가
                          controller.add(text);
                        },
                        focusedAreaCenter: Offset(0, -100),
                        focusedAreaHeight: 70,
                        focusedAreaWidth: 250,
                        paintTextStyle: ui.TextStyle(color: Colors.transparent),
                        textBackgroundPaint: Paint()
                          ..color = Colors.transparent,
                      ),
                    ),

                    // 와인명
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 80,
                      child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.transparent,
                        child: Text(
                          '인식된 와인이름',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    // OCR 인식한 글자
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 120,
                      child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.transparent,
                        child: Text(
                          recognizedText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // 스캐너 박스
                    Positioned(
                      bottom: 400,
                      left: 40,
                      right: 40,
                      top: 200,
                      child: ScannerOverlay(
                        width: 50,
                        height: 50,
                        borderColor: Colors.green,
                        borderRadius: 1,
                        borderThickness: 5,
                      ),
                    ),

                    // 안내 문구
                    Positioned(
                      bottom: 410,
                      left: 50,
                      right: 50,
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          '와인명을 박스크기에 알맞게 조정하세요',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    // 촬영 버튼
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Container(
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              try {
                                // TODO: 인식된 와인명이 없을 경우, 와인이름을 인식하세요 Toast 띄우고 이동 거부
                                await _initializeControllerFuture;
                                _showCameraBottomSheet(context, recognizedText: recognizedText);
                                // Navigator.of(context).pushReplacement(
                                //   CupertinoPageRoute(
                                //     // builder: (context) => SearchResultScreen(
                                //     //     searchValue: recognizedText),
                                //     builder: (context) => WineSearchScreen(
                                //         keyword: recognizedText),
                                //   ),
                                // );
                              } catch (e) {
                                print('카메라 오류: $e');
                              }
                            },
                            borderRadius: BorderRadius.circular(40),
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Colors.black,
                // Center 위젯을 사용하여 가운데 배치
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: const CircularProgressIndicator(
                            color: AppColors.primary,
                            backgroundColor: AppColors.primaryLight,
                            strokeWidth: 8,
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 0,
                        bottom: 335,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Loading...',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: AppFontSizes.medium,
                                fontWeight: ui.FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
