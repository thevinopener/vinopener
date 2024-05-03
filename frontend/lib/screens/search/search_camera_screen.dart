import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

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
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.medium,
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
      appBar: AppBar(title: const Text('카메라 화면')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 카메라 미리보기 활성화
            return CameraPreview(_controller);
          } else {
            // 로딩 인디케이터 표시
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!mounted) return;

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print('카메라 오류: $e');
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
      appBar: AppBar(title: const Text('캡쳐 화면')),
      body: Image.file(File(imagePath)),
    );
  }
}
