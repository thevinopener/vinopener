import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/colors.dart';

class DismissibleBottomSheetView extends StatelessWidget {
  final Widget childView;

  const DismissibleBottomSheetView({required this.childView});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        color: Colors.white,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: AppColors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: childView,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
