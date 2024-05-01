import 'package:flutter/foundation.dart';
import 'package:frontend/models/user.dart';

class UserProvider with ChangeNotifier {

  User _user;

  UserProvider(this._user);

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}