import 'package:flutter/foundation.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/firestore/firestore.dart';


class User {
  String name, id, icon, email;
  bool exists;

  User({
    this.name = '',
    this.id = '',
    this.icon = '',
    this.email = '',
    this.exists = true,
  });
}

class UserState extends ChangeNotifier {
  static bool Load_Mock_Data = false;
  final int _delayTime = 250;

  User data = User(exists: false);

  UserState() {
    var currentUser = FirestoreApi.active_user_information;

    if (currentUser != null) {
      _login(
        id: currentUser.uid,
        name: currentUser.displayName ?? '',
        email: currentUser.email ?? '',
        icon: currentUser.photoURL ?? Constants.live_svgs + currentUser.uid + '.svg',
      );
      return;
    }

    if (!UserState.Load_Mock_Data) return;

    _login(
      name: AppDebugLogin.username,
      email: AppDebugLogin.email,
      id: AppDebugLogin.id,
      icon: AppDebugLogin.icon,
    );
  }

  void _login({
    String id = '',
    String email = '',
    String name = '',
    String icon = AppDebugLogin.icon,
  }) {
    data = User(
      name: name,
      id: id,
      icon: icon,
      email: email,
    );
  }

  void logout() {
    FirestoreApi.logout();
    data = User(exists: false);
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
      var currentUser = FirestoreApi.active_user_information;

      if (currentUser != null) {
        _login(
          id: currentUser.uid,
          name: currentUser.displayName ?? '',
          email: currentUser.email ?? '',
          icon: currentUser.photoURL ?? Constants.live_svgs + currentUser.uid + '.svg',
        );
      }
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
  static const bool bypass = false;
  static const String username = 'fake user';
  static const String email = 'fake_email@gmail.com';
  static const String id = 'fake_id';
  static const String icon = '''${Constants.live_svgs}fake_icon.svg''';
}
