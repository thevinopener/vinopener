import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';

import '../../widgets/note/note_stt_widget.dart';  // STT Widget을 포함합니다.

class DismissibleBottomSheetView extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChangeRequest;

  DismissibleBottomSheetView({Key? key, required this.currentPage, required this.onPageChangeRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.6),
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        color: AppColors.black,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child:Container(
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black,
                          child: SttWidget(currentPage: currentPage, onPageChangeRequest: onPageChangeRequest),  // STT Widget 삽입
                        ),),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
