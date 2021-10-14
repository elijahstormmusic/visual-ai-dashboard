import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:visual_ai/controllers/menu_controller.dart';
import 'package:visual_ai/screens/main/screen.dart';
import 'package:visual_ai/screens/components/animations/loading.dart';
import 'package:visual_ai/screens/components/error.dart';
import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/login/login_screen.dart';


class UI_Manager extends StatefulWidget {
  static const routeName = '/dash_main';

  @override
  _UI_ManagerState createState() => _UI_ManagerState();
}

class _UI_ManagerState extends State<UI_Manager> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget mainScreen(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MenuController()),
      ChangeNotifierProvider(create: (context) => UserState()),
    ],
    child: Consumer<UserState>(
      builder: (context, userstate, child) {
        return userstate.data.exists
          ? MainScreen()
          : LoginScreen();
      },
    ),
  );

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: _initialization,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return ErrorDisplay(snapshot.error.toString());
      }

      if (snapshot.connectionState == ConnectionState.done) {
        return mainScreen(context);
      }

      return Loading();
    },
  );
}
