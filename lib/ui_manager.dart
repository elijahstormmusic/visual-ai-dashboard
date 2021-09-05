import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/controllers/MenuController.dart';
import 'package:visual_ai/screens/main/screen.dart';


class UI_Manager extends StatefulWidget {
  static const routeName = '/dash_main';

  static _UI_State state = _UI_State();

  static void friendly() {
    state.changeDisplay(true);
  }
  static void normal() {
    state.changeDisplay(false);
  }

  @override
  _UI_State createState() => UI_Manager.state;
}

class _UI_State extends State<UI_Manager> {

  bool _friendlyDisplay = false;

  void changeDisplay(bool friendly) =>
    setState(() => _friendlyDisplay = friendly);

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MenuController(),
      ),
    ],
    child: MainScreen(),
  );
}
