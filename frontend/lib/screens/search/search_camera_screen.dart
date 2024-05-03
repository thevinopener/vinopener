import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:frontend/constants/colors.dart';

class SearchCameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const SearchCameraScreen({
    super.key,
    required this.camera,
  });

  @override
  State<SearchCameraScreen> createState() => _SearchCameraScreenState();
}

class _SearchCameraScreenState extends State<SearchCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium,
        enableAudio: false // 오디오를 사용하지 않습니다.
        );
    // 컨트롤러 초기화와 함께 플래시를 꺼진 상태로 설정
    _initializeControllerFuture = _controller.initialize().then((_) {
      if (mounted) {
        _controller.setFlashMode(FlashMode.off);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 카메라 미리보기를 Container 안에서 조절
            return Container(
              height: double.maxFinite, // 높이 조절
              width: double.infinity, // 폭은 화면 전체 크기
              child: Stack(
                children: [
                  // 카메라 화면
                  Container(
                    height: double.maxFinite, // 카메라 화면 세로길이
                    width: double.infinity, // 카메라 화면 가로길이
                    child: CameraPreview(_controller), // 카메라 미리보기
                  ),

                  // CameraPreview(_controller),

                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                        stops: [0.0, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                    },
                    blendMode: BlendMode.dstOut,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 250,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ),
                  ),

                  // 전체 블러 처리된 가운데 집중 박스
                  // Container(
                  //   width: double.maxFinite,
                  //   height: double.maxFinite,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black.withOpacity(0.5),
                  //   ),
                  // ),
                  //
                  // Positioned(
                  //   top: 80,
                  //   bottom: 250,
                  //   left: 30,
                  //   right: 30,
                  //   child: Container(
                  //     width: 250,
                  //     height: 400,
                  //   color: Colors.orange,
                  //   // decoration: BoxDecoration(
                  //   //   color: Colors.black.withOpacity(0.5),
                  //   // ),
                  // ),
                  // ),

                  //   child: Center(
                  //     child: ClipOval(
                  //       child: Container(
                  //         height: 400,
                  //         width: 400,
                  //         color: Colors.transparent,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // 상단 뒤로가기 버튼

                  // 라벨 <> 메뉴판 전환버튼

                  // 좌측하단 이미지 피커

                  // 사진촬영 버튼
                  Positioned(
                    bottom: 10, // 하단에서 10 픽셀 위치
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Material(
                        // Material 위젯 추가
                        color: Colors.transparent, // Material 배경을 투명하게 설정
                        child: InkWell(
                          onTap: () async {
                            try {
                              await _initializeControllerFuture;
                              final image = await _controller.takePicture();
                              if (!mounted) return;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayPictureScreen(
                                      imagePath: image.path),
                                ),
                              );
                            } catch (e) {
                              print('카메라 오류: $e');
                            }
                          },
                          borderRadius:
                              BorderRadius.circular(40), // 아이콘 크기에 맞게 조정
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
            // 로딩 인디케이터 표시
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// 찍은 사진을 보여주는 위젯
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캡처 화면')),
      body: Image.file(File(imagePath)),
    );
  }
}

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

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

