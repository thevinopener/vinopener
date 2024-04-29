import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

import '../../constants/fonts.dart';

class SelectKindButton extends StatefulWidget {
  final Function(Set<String>) onSelected; // 새로운 콜백 정의

  const SelectKindButton({Key? key, required this.onSelected})
      : super(key: key);

  @override
  _SelectedStatus createState() => _SelectedStatus();
}

class _SelectedStatus extends State<SelectKindButton> {
  Set<String> _selectedKinds = {};

  void _toggleKind(String kind) {
    setState(() {
      if (_selectedKinds.contains(kind)) {
        _selectedKinds.remove(kind);
      } else {
        _selectedKinds.add(kind);
      }
    });
    widget.onSelected(_selectedKinds); // 콜백 함수 호출
  }

  Widget _buildButton(String label) {
    final bool isSelected = _selectedKinds.contains(label);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        // 좌우 패딩으로 버튼 사이 간격 조절

        child: OutlinedButton(
          onPressed: () => _toggleKind(label),
          style: OutlinedButton.styleFrom(
            backgroundColor: isSelected ? AppColors.primary : Colors.white,
            foregroundColor: isSelected ? Colors.white : AppColors.primary,
            side: BorderSide(color: AppColors.primary, width: 2),
          ),
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.mediumSmall),
              label),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <String>['레드', '화이트', '로제', '포트', '스파클링', '디저트']
            .map(_buildButton)
            .toList(),
      ),
    );
  }
}
