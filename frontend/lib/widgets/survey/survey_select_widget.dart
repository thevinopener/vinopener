import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class SelectKindButton extends StatefulWidget {
  @override
  State<SelectKindButton> createState() => _SelectedStatus();
}

class _SelectedStatus extends State<SelectKindButton> {
  final Set<String> _selectedKinds = {};

  // 이 함수는 버튼이 눌렸을 때 호출되며, 선택된 항목들을 관리합니다.
  void _toggleKind(String kind) {
    setState(() {
      if (_selectedKinds.contains(kind)) {
        _selectedKinds.remove(kind);
      } else {
        _selectedKinds.add(kind);
      }
    });
  }

  // 버튼의 스타일을 결정하고 패딩을 적용하는 함수입니다.
  Widget _buildButton(String label) {
    final bool isSelected = _selectedKinds.contains(label);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0), // 좌우 패딩으로 버튼 사이 간격 조절
      child: OutlinedButton(
        onPressed: () => _toggleKind(label),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primary : AppColors.white,
          foregroundColor: isSelected ? AppColors.white : AppColors.primary,
          side: BorderSide(color: AppColors.primary, width: 2),
        ),
        child: Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppFontSizes.mediumSmall), label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // 버튼들을 왼쪽에서부터 시작하게 배치
          children: <Widget>[
            _buildButton('레드'),
            _buildButton('화이트'),
            _buildButton('로제'),
            _buildButton('포트'),
            _buildButton('스파클링'),
            _buildButton('디저트'),
            _buildButton('잘 모르겠음'),
          ],
        ),
      ),
    );
  }
}
