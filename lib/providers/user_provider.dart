import 'package:flutter/material.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => [..._users];

  void addUser(
    int id,
    String passCode,
    List profile,
  ) {
    _users.add(User(
      id: id,
      passCode: passCode,
      profile: profile,
    ));

    notifyListeners();
  }
}
