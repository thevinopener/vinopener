import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/icon.dart';
import '../../models/note_model.dart';
import '../../providers/note/note_wine_provider.dart';

class WineFlavourSelect extends StatefulWidget {
  final Flavour flavour;
  final bool isSelected;

  const WineFlavourSelect(
      {Key? key, required this.flavour, required this.isSelected})
      : super(key: key);

  @override
  _WineFlavourSelectState createState() => _WineFlavourSelectState();
}

class _WineFlavourSelectState extends State<WineFlavourSelect> {
  late bool isSelected;
  late final Flavour flavour;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
    flavour = widget.flavour;
  }

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        // 여기서 provider를 통해 ID 추가/제거 로직 수행
        final provider = Provider.of<NoteProvider>(context, listen: false);
        if (isSelected) {
          provider.addFlavourId(widget.flavour.id);
        } else {
          provider.removeFlavourId(widget.flavour.id);
        }
      },
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.primary, width: 3.0), // 두꺼운 테두리 적용
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.grey, width: 1.0), // 두꺼운 테두리 적용
              ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage(WineIcon.Flavour[flavour.taste] ??
                        'assets/images/penguin.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              child: Text(
                flavour.taste,
                style: TextStyle(fontSize: AppFontSizes.verySmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
