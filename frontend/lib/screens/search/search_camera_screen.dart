// flutter
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

// constants
import 'package:frontend/constants/fonts.dart';

// pub.dev
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

class SearchCameraScreen extends StatefulWidget {
  const SearchCameraScreen({super.key});

  @override
  _SearchCameraScreenState createState() => _SearchCameraScreenState();
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _SearchCameraScreenState extends State<SearchCameraScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  // XFile? videoFile;  비디오 안씀
  // VoidCallback? videoPlayerListener;
  bool enableAudio = true;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _exposureModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _exposureModeControlRowAnimation = CurvedAnimation(
      parent: _exposureModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _focusModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusModeControlRowAnimation = CurvedAnimation(
      parent: _focusModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    _exposureModeControlRowAnimationController.dispose();
    super.dispose();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // _initializeCameraController(cameraController.description);
    }
  }
  // #enddocregion AppLifecycle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        height: double.maxFinite,
        width: double.infinity,
        child: Stack(
          children: [
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
            Text(
              'Camera',
              style: TextStyle(
                fontSize: AppFontSizes.large,
              ),
=======
>>>>>>> Stashed changes
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
<<<<<<< Updated upstream
                      border: Border.all(
                        color: controller != null &&
                                controller!.value.isRecordingVideo
                            ? Colors.redAccent
                            : Colors.grey,
                        width: 3.0,
                      ),
=======
                      // border: Border.all(
                      //   color: controller != null &&
                      //           controller!.value.isRecordingVideo
                      //       ? Colors.redAccent
                      //       : Colors.grey,
                      //   width: 3.0,
                      // ),
>>>>>>> Stashed changes
                    ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(1.0),
                    //       child: Center(
                    //         child: _cameraPreviewWidget(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // _captureControlRowWidget(),
                    // _modeControlRowWidget(),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Row(
                    //     children: <Widget>[
                    //       _cameraTogglesRowWidget(),
                    //       _thumbnailWidget(),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ],
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _cameraPreviewWidget() {
//   final CameraController? cameraController = controller;
//
//   if (cameraController == null || !cameraController.value.isInitialized) {
//     return const Text(
//       'Tap a camera',
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 24.0,
//         fontWeight: FontWeight.w900,
//       ),
//     );
//   } else {
//     return Listener(
//       onPointerDown: (_) => _pointers++,
//       onPointerUp: (_) => _pointers--,
//       child: CameraPreview(
//         controller!,
//         child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               return GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onScaleStart: _handleScaleStart,
//                 onScaleUpdate: _handleScaleUpdate,
//                 onTapDown: (TapDownDetails details) =>
//                     onViewFinderTap(details, constraints),
//               );
//             }),
//       ),
//     );
//   }
