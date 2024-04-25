import 'package:flutter/foundation.dart';

class BottomBarProvider with ChangeNotifier {
  int _currentIndex = 0; // 현재 선택된 하단 바의 인덱스

  int get currentIndex => _currentIndex; // 현재 인덱스를 가져오는 getter

  void setIndex(int index) {
    _currentIndex = index; // 선택된 인덱스로 업데이트
    notifyListeners(); // 상태 변화를 관찰하는 리스너들에게 알림
  }
}
