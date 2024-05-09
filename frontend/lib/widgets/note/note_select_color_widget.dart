import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';


import '../common/atoms/wine_color_widget.dart'; // 수정: 경로 확인

class NoteColor extends StatefulWidget {
  const NoteColor({Key? key}) : super(key: key);

  @override
  State<NoteColor> createState() => _NoteColorState();
}

class _NoteColorState extends State<NoteColor> {
  int? wineColorId; // 선택된 와인 색상 ID

  List<String> wineColorNames = [
    "밀짚색", "노란색", "황금색", "호박색", "갈색", "구리색", "연어색", "분홍색", "루비색", "보라색", "석류색", "황갈색",
  ];

  void updateAndPrintWineColorId(String colorName, int colorId) {
    setState(() {
      wineColorId = colorId; // 색상 ID 할당
    });
    print('Selected Wine Color ID: $wineColorId');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 1.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -2,
          )
        ],
      ),
      child: GridView.builder(
        itemCount: wineColorNames.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String colorName = wineColorNames[index];
          Color? wineColor = WineColors.wineColorMap['$colorName'];
          int colorId = WineColorsId.wineColorIdMap['$colorName'] ?? 0;
          bool isSelected = wineColorId == colorId;

          return InkWell(
            onTap: () => updateAndPrintWineColorId(colorName, colorId),
            child: Container(
              decoration: BoxDecoration(
                border: isSelected ? Border.all(color: AppColors.primary, width: 4) : null,
                  borderRadius: BorderRadius.circular(12),
              ),
              child: WineColorBlock(
                wineColor: wineColor,
                colorName: colorName,
              ),
            ),
          );
        },
      ),
    );
  }
}
