import 'package:flutter/foundation.dart';
import 'package:frontend/models/user.dart';

class UserProvider with ChangeNotifier {

  UserModel _user;

  UserProvider(this._user);

  UserModel get user => _user;

  int getUserId() {
    return _user.id!;
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}