// flutter
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// constants
import 'package:frontend/constants/colors.dart';

// screen
import 'package:frontend/screens/search/search_camera_capture_screen.dart';

// package
import 'package:scanner_overlay/scanner_overlay.dart';
import 'package:focused_area_ocr_flutter/focused_area_ocr_flutter.dart';
import 'package:image/image.dart' as img;

Future<File> cropImageToFocusedArea(
    String imagePath, Offset focusedCenter, double width, double height) async {
  // 이미지 경로에서 파일 객체를 생성
  var originalImageFile = File(imagePath);

  // 파일로부터 바이트 데이터를 읽어와서 이미지 디코딩
  final originalBytes = await originalImageFile.readAsBytes();
  final originalImage = img.decodeImage(originalBytes);

  // 이미지 디코딩 실패 시 예외 발생
  if (originalImage == null) {
    throw Exception("Could not decode image");
  }

  // FocusedArea 중심 좌표를 실제 이미지의 중심을 기준으로 계산하여 자를 시작 좌표를 구함
  final int cropX = ((focusedCenter.dx + originalImage.width / 2) - width / 2).toInt();
  final int cropY = ((focusedCenter.dy + originalImage.height / 2) - height / 2).toInt();

  // 자를 영역의 너비와 높이를 정수 값으로 변환
  final int cropWidth = width.toInt();
  final int cropHeight = height.toInt();

  // 주어진 좌표와 크기로 이미지를 자름
  var croppedImage = img.copyCrop(originalImage, cropX, cropY, cropWidth, cropHeight);

  // 시스템 임시 디렉터리 경로에서 파일 객체를 생성하여 잘린 이미지를 PNG로 저장
  var tempDir = Directory.systemTemp;
  var croppedImageFile = File("${tempDir.path}/cropped_image.png");
  await croppedImageFile.writeAsBytes(img.encodePng(croppedImage));

  // 잘린 이미지 파일 객체를 반환
  return croppedImageFile;
}


class SearchCameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const SearchCameraScreen({super.key, required this.camera});

  @override
  State<SearchCameraScreen> createState() => _SearchCameraScreenState();
}

class _SearchCameraScreenState extends State<SearchCameraScreen> {
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

  @override
  void dispose() {
    _controller.dispose();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final Offset focusedAreaCenter = Offset(
      0,
      (statusBarHeight + kToolbarHeight + _textViewHeight) / 2,
    );

    return Scaffold(
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
                          color: AppColors.primary,
                          fontSize: 25,
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
                              await _initializeControllerFuture;

                              var image = await _controller.takePicture();
                              if (!mounted) return;

                              final focusedCenter = Offset(0, -100);
                              final double focusedWidth = 500;
                              final double focusedHeight = 70;
                              var croppedImageFile =
                                  await cropImageToFocusedArea(
                                image.path,
                                focusedCenter,
                                focusedWidth,
                                focusedHeight,
                              );

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SearchCameraCaptureScreen(
                                    imagePath: croppedImageFile.path,
                                    recognizedText: recognizedText,
                                  ),
                                ),
                              );
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
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.black,
              ),
            );
          }
        },
      ),
    );
  }
}

// // 찍은 사진을 표시하는 화면
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//   final String recognizedText;
//
//   const DisplayPictureScreen({
//     super.key,
//     required this.imagePath,
//     required this.recognizedText,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('캡처 화면')),
//       body: Container(
//         child: Column(
//           children: [
//             Image.file(File(imagePath)),
//             Text('$recognizedText'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 구멍을 그리는 커스텀 페인터 클래스
class HolePainter extends CustomPainter {
  final BuildContext context;

  HolePainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect backgroundRect = Offset.zero & size;

    final Rect holeRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 250,
      height: 400,
    );

    final Path path = Path()
      ..addRect(backgroundRect)
      ..addRect(holeRect);

    final Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..blendMode = BlendMode.dstOut;

    // 구멍을 그리지 않도록 drawPath를 생략하거나 필요에 따라 사용
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
