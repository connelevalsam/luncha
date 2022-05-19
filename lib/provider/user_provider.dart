import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username;
  String _uid;
  String _dp;

  get username => _username;
  get uid => _uid;
  get dp => _dp;

  void setUser(String username, String uid, String dp) {
    _username = username;
    _uid = uid;
    _dp = dp;

    notifyListeners();
  }

  void clearUser() async {
    _username = null;
    _uid = null;
    _dp = null;
  }
}
