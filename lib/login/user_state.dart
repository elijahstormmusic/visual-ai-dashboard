import 'package:flutter/foundation.dart';
import 'package:visual_ai/constants.dart';

import 'package:visual_ai/firestore/firestore.dart';


class User {
  String name;
  String auth;
  String icon;

  User({
    this.name = '',
    this.auth = '',
    this.icon = '',
  });
}

class UserState extends ChangeNotifier {
  static bool Load_Mock_Data = false;
  final int _delayTime = 250;

  User data = User();

  UserState() {
    if (!UserState.Load_Mock_Data) return;

    _login(AppDebugLogin.username, AppDebugLogin.password);
  }

  void _login(String name, String auth) {
    data = User(
      name: name,
      auth: auth,
      icon: '''${Constants.live_svgs}${
        name.substring(0, name.indexOf('@'))
      }.svg''',
    );
  }

  void logout() {
    FirestoreApi.logout();
    data = User();
    notify();
  }

  void notify() {
    notifyListeners();
  }

  Future<String?> supply(String _name, String _auth) async {
    ResponseData response = ResponseData(
      user: _name,
      pass: _auth,
    );

    FirestoreApi.login(response);

    while (!response.validated) {
      await Future.delayed(Duration(milliseconds: _delayTime));
    }

    if (response.failure == null) {
      _login(_name, _auth);
    }

    return response.failure;
  }

  Future<String?> recover(String _name) async {
    ResponseData response = ResponseData(
      user: _name,
      pass: '',
    );

    while (!response.validated) {
      await Future.delayed(Duration(milliseconds: _delayTime));
    }

    return response.failure;
  }
}

class AppDebugLogin {
  static bool bypass = true;
  static String username = 'elijahstormmusic@gmail.com';
  static String password = 'tester';
}
