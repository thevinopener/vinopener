import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:frontend/constants/colors.dart';
<<<<<<< Updated upstream
import 'package:scanner_overlay/scanner_overlay.dart';
import 'dart:ui'; // ImageFilter를 사용하기 위해 추가
import 'package:focused_area_ocr_flutter/focused_area_ocr_flutter.dart';
=======
import 'package:frontend/constants/fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanner_overlay/scanner_overlay.dart';
import 'package:focused_area_ocr_flutter/focused_area_ocr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image/image.dart' as img;

Future<File> cropImageToFocusedArea(String imagePath, Offset focusedCenter, double width, double height) async {
  // 원본 이미지를 읽어들입니다.
  final originalImageFile = File(imagePath);
  final originalBytes = await originalImageFile.readAsBytes();
  final originalImage = img.decodeImage(originalBytes);

  if (originalImage == null) {
    throw Exception("Could not decode image");
  }

  // 초점 영역의 중심을 기준으로 잘라낼 좌표와 크기를 계산합니다.
  final int cropX = (focusedCenter.dx - width / 2).toInt();
  final int cropY = (focusedCenter.dy - height / 2).toInt();
  final int cropWidth = width.toInt();
  final int cropHeight = height.toInt();

  // 이미지를 자릅니다.
  final croppedImage = img.copyCrop(originalImage, cropX, cropY, cropWidth, cropHeight);

  // 잘라낸 이미지를 임시 파일로 저장합니다.
  final tempDir = Directory.systemTemp;
  final croppedImageFile = File("${tempDir.path}/cropped_image.png");
  await croppedImageFile.writeAsBytes(img.encodePng(croppedImage));

  return croppedImageFile;
}
>>>>>>> Stashed changes

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
  File? _selectedImageFile;
  File? _recentImageFile; // 최근 사진을 저장하는 변수
  final _imagePicker = ImagePicker(); // ImagePicker 객체 생성

  final StreamController<String> controller = StreamController<String>();
  final double _textViewHeight = 80.0;

  Future<void> _getRecentImage() async {
    if (await Permission.storage.request().isGranted) {
      for (int i=0; i<10; i++) {
        print('asdfasdfasdfasdf 성공이야 씨발');
      }
      // 가장 최근 이미지를 가져옵니다.
      final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _recentImageFile = File(pickedImage.path);
        });
      }
    } else {
      print("저장소 접근 권한이 없습니다.");
      for (int i=0; i<10; i++) {
        print('asdfasdfasdfasdf 실패실패실패실패실패실패실패실패 씨발');
      }
    }
  }

  Future pickImageFromGallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImageFile = File(pickedImage!.path);
    });
  }

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String recognizedText = '';

  // 앨범에서 이미지를 선택하는 함수 (하단 팝업)
  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _recentImageFile = File(pickedImage.path);
      });
    }
  }

  final StreamController<String> controller = StreamController<String>();
  final double _textViewHeight = 80.0;

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
    // Stream을 받는 즉시 recognizedText에 저장
    controller.stream.listen((text) {
      setState(() {
        recognizedText = text;
      });
    });
    // 초기화할 때 가장 최근의 이미지를 불러오기
    _getRecentImage();
  }

  // 아이콘으로 최근 이미지를 표시하는 위젯 부분
  Widget _buildRecentImageButton() {
    return IconButton(
      iconSize: 80,
      icon: _recentImageFile != null
          ? ImageIcon(FileImage(_recentImageFile!))
          : const Icon(Icons.photo),
      onPressed: _pickImageFromGallery,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
            // 전체 Container
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  // 카메라 Preview 영역
                  Container(
<<<<<<< Updated upstream
                    height: double.maxFinite, // 카메라 화면 세로길이
                    width: double.infinity, // 카메라 화면 가로길이
                    child: CameraPreview(_controller), // 카메라 미리보기
                  ),

                  // CameraPreview(_controller),

                  FocusedAreaOCRView(
                    onScanText: (text) {
                      controller.add(text); // 인식된 텍스트를 StreamController에 추가
                    },
                    focusedAreaCenter: focusedAreaCenter, // 초점 영역의 중심 위치 설정
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        height: _textViewHeight,
                        color: Colors.black,
                        child: StreamBuilder<String>(
                          stream:
                              controller.stream, // StreamController에서 스트림 받아오기
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            return Text(
                              snapshot.data != null
                                  ? snapshot.data!
                                  : '', // 인식된 텍스트 표시
                              style: const TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),

                      // 스캐너 모양
                      Positioned(
                        top: 50,
                        bottom: 250,
                        left: 30,
                        right: 30,
                        child: ScannerOverlay(
                          height: 350,
                          width: 350,
                          borderColor: Colors.green,
                          borderRadius: 10,
                          borderThickness: 5,
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
                                      builder: (context) =>
                                          DisplayPictureScreen(
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
=======
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: FocusedAreaOCRView(
                      onScanText: (text) {
                        controller.add(text); // 인식된 텍스트를 StreamController에 추가
                      },
                      focusedAreaCenter: Offset(0, -100), // 초점 영역의 중심 위치 설정
                      focusedAreaHeight: 70,
                      focusedAreaWidth: 250,
                    ),
                  ),

                  // 스캐너 모양
                  Positioned(
                    bottom: 280,
                    left: 58,
                    right: 58,
                    top: 80,
                    child: ScannerOverlay(
                      width: 150,
                      height: 100,
                      borderColor: Colors.green,
                      borderRadius: 10,
                      borderThickness: 5,
                    ),
                  ),

                  // OCR 인식된 텍스트 노출 영역
                  Positioned(
                    bottom: 130,
                    left: 50,
                    right: 50,
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.transparent,
                      child: Text(
                        recognizedText, // recognizedText 변수를 텍스트에 사용합니다.
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  // 상단 뒤로가기 버튼

                  // 좌측하단 이미지 피커
                  // Positioned(
                  //   child: Container(
                  //     alignment: Alignment.bottomLeft,
                  //     child: _buildRecentImageButton(),
                  //   ),
                  // ),

                  // 사진촬영 버튼
                  Positioned(
                    bottom: 10, // 하단에서 10 픽셀 위치
                    left: 10,
                    right: 10,
                    child: Container(
                      alignment: Alignment.center,
                      child: Material(
                        // Material 위젯 추가
                        color: Colors.transparent, // Material 배경을 투명하게 설정
                        child: InkWell(
                            onTap: () async {
                              try {
                                await _initializeControllerFuture;

                                // 사진을 찍습니다.
                                final image = await _controller.takePicture();
                                if (!mounted) return;

                                // FocusedAreaOCRView 영역을 기준으로 이미지를 자릅니다.
                                final focusedCenter = Offset(0, -100); // FocusedAreaOCRView에서 사용한 초점 영역 중심 좌표
                                final double focusedWidth = 500;
                                final double focusedHeight = 70;
                                final croppedImageFile = await cropImageToFocusedArea(
                                  image.path,
                                  focusedCenter,
                                  focusedWidth,
                                  focusedHeight,
                                );

                                // 잘라낸 이미지를 DisplayPictureScreen으로 전달합니다.
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DisplayPictureScreen(
                                      imagePath: croppedImageFile.path,
                                      recognizedText: recognizedText,
                                    ),
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
>>>>>>> Stashed changes
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            // 로딩 인디케이터 표시
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.black,
            ));
          }
        },
      ),
    );
  }
}

// 찍은 사진을 보여주는 위젯
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String recognizedText;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.recognizedText});

  void _printRecognizedText() {
    for (int i = 0; i < 10; i++) {
      print('이거보세요오오옷~!~!~!: ' + recognizedText);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 위젯이 완전히 빌드된 후에 콜백 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _printRecognizedText(); // 빌드 후에만 한 번 실행됩니다.
    });

    return Scaffold(
      appBar: AppBar(title: const Text('캡처 화면')),
      body: Container(
        child: Column(
          children: [
            Image.file(File(imagePath)),
            Text('${recognizedText}'),
          ],
        ),
      ),
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
