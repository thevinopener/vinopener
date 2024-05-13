import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

import 'package:frontend/widgets/common/atoms/wine_color_widget.dart'; // 수정: 경로 확인
import 'package:provider/provider.dart';

import '../../providers/note/note_wine_provider.dart'; // Provider 패키지를 임포트합니다.

class NoteColor extends StatefulWidget {
  const NoteColor({Key? key}) : super(key: key);

  @override
  State<NoteColor> createState() => _NoteColorState();
}

class _NoteColorState extends State<NoteColor> {
  List<String> wineColorNames = [
    "밀짚색", "노란색", "황금색", "호박색", "갈색", "구리색", "연어색", "분홍색", "루비색", "보라색", "석류색", "황갈색",
  ];

  void updateAndPrintWineColorId(String colorName, int colorId) {
    final provider = Provider.of<NoteProvider>(context, listen: false);
    provider.updateNoteProvider(colorId: colorId); // provider를 사용하여 colorId를 업데이트합니다.
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
          Color? wineColor = WineColors.wineColorMap[colorName];
          int colorId = WineColorsId.wineColorIdMap[colorName] ?? 0;
          bool isSelected = Provider.of<NoteProvider>(context).colorId == colorId; // provider로부터 colorId를 가져와 비교합니다.

          return InkWell(
            onTap: () => updateAndPrintWineColorId(colorName, colorId),
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: isSelected ? Border.all(color: AppColors.primary, width: 4) : null,
                borderRadius: BorderRadius.circular(15),
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
