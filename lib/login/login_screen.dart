import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'custom_route.dart';
import 'user_state.dart';
import 'users.dart';

import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/theme.dart';
import 'package:visual_ai/constants.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'User does not exist';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }

      UserState.User = data.name;
      UserState.Auth = data.password;
      UserState.Pic = '''${Constants.live_svgs}${
        data.name.substring(0, data.name.indexOf('@'))
      }.svg''';

      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {

    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: Constants.appName,
      logo: 'assets/images/logo.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      loginProviders: [],
      loginAfterSignUp: false,
      hideForgotPasswordButton: true,
      hideSignUpButton: true,
      messages: LoginMessages(
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm Password',
        loginButton: 'LOGIN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot Password?',
        recoverPasswordButton: 'SEND EMAIL',
        goBackButton: 'BACK',
        confirmPasswordError: 'Your password do not match',
        recoverPasswordIntro: 'Tell us your email',
        recoverPasswordDescription: 'Then we can help you set a new, secure password',
        recoverPasswordSuccess: 'Email Sent',
      ),
      theme: LoginTheme(
        primaryColor: Theme.of(context).accentColor,
        accentColor: Theme.of(context).primaryColor,
        errorColor: Theme.of(context).errorColor,
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Theme.of(context).primaryColor,
        ),
        cardTheme: CardTheme(
          color: Theme.of(context).primaryColor,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.zero,
          labelStyle: TextStyle(fontSize: 12),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).accentColor,
          highlightColor: Colors.red,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      passwordValidator: (value) {
        if (value == null) {
          return 'Password is empty';
        }
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => UI_Manager(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: true,
    );
  }
}
