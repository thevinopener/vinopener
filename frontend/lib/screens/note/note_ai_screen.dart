import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';

import '../../widgets/note/note_stt_widget.dart';  // STT Widget을 포함합니다.

class DismissibleBottomSheetView extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChangeRequest;
  final GlobalKey<SttWidgetState> sttWidgetKey = GlobalKey<SttWidgetState>();

  DismissibleBottomSheetView({Key? key, required this.currentPage, required this.onPageChangeRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height*0.4,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF14131C),
                          border: Border.all(
                            color: Color(0xFF14131C), // 여기서 원하는 경계선의 색상으로 변경하세요.
                            width: 1.0, // 경계선의 두께를 조절할 수 있습니다.
                          ),
                        ),
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            // SttWidget의 메서드 호출
                            sttWidgetKey.currentState?.stopTtsAndStt();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child:Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFF14131C),
                          child: SttWidget(
                              key: sttWidgetKey,
                              currentPage: currentPage,
                              onPageChangeRequest: onPageChangeRequest
                          ),  // STT Widget 삽입
                        ),
                      ),
                    ],
                  ),),
            ),
          ],
        ),
      ),
    );
  }
}

