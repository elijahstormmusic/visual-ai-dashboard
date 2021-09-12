import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/flutter_login.dart';

import 'custom_route.dart';
import 'user_state.dart';

import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/constants.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(UserState userstate, LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      return await userstate.supply(data.name, data.password);
    });
  }

  Future<String?> _recoverPassword(UserState userstate, String name) {
    return Future.delayed(loginTime).then((_) async {
      return await userstate.recover(name);
    });
  }

  @override
  Widget build(BuildContext context) {

    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return Consumer<UserState>(
      builder: (context, userstate, child) {
        return FlutterLogin(
          title: Constants.appName,
          logo: Constants.logo_asset,
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
            primaryColor: Theme.of(context).canvasColor,
            accentColor: Theme.of(context).accentColor,
            errorColor: Theme.of(context).errorColor,
            titleStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
            bodyStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
            cardTheme: CardTheme(
              color: Theme.of(context).cardColor,
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
            buttonStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Theme.of(context).primaryColor,
            ),
            buttonTheme: LoginButtonTheme(
              splashColor: Theme.of(context).accentColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              highlightColor: Theme.of(context).errorColor,
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
            return _loginUser(userstate, loginData);
          },
          onSignup: (loginData) {
            return _loginUser(userstate, loginData);
          },
          onSubmitAnimationCompleted: () {
            userstate.notify();
          },
          onRecoverPassword: (name) {
            return _recoverPassword(userstate, name);
            // Show new password dialog
          },
          showDebugButtons: false,
        );
      },
    );
  }
}
