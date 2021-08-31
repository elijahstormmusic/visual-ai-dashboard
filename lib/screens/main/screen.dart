import 'package:visual_ai/controllers/MenuController.dart';
import 'package:visual_ai/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

import 'package:visual_ai/screens/pages/dashboard/screen.dart';
import 'package:visual_ai/screens/pages/performance/screen.dart';
import 'package:visual_ai/screens/pages/training/screen.dart';
import 'package:visual_ai/screens/pages/database/screen.dart';
import 'package:visual_ai/screens/pages/store/screen.dart';
import 'package:visual_ai/screens/pages/notification/screen.dart';
import 'package:visual_ai/screens/pages/profile/screen.dart';
import 'package:visual_ai/screens/pages/settings/screen.dart';


class MainScreen extends StatefulWidget {

  static _ScreenManagerState state = _ScreenManagerState();

  static void Dashboard() =>
    MainScreen.state.selectedTab(0);
  static void Performance() =>
    MainScreen.state.selectedTab(1);
  static void Training() =>
    MainScreen.state.selectedTab(2);
  static void Database() =>
    MainScreen.state.selectedTab(3);
  static void Store() =>
    MainScreen.state.selectedTab(4);
  static void Notification() =>
    MainScreen.state.selectedTab(5);
  static void Profile() =>
    MainScreen.state.selectedTab(6);
  static void Settings() =>
    MainScreen.state.selectedTab(7);

  @override
  _ScreenManagerState createState() => MainScreen.state;
}

class _ScreenManagerState extends State<MainScreen> {

  int _selectedIndex = 0;
  void selectedTab(index) {
    setState(() => _selectedIndex = index);
  }
  Widget _decideInteriorBody() {
    var choice;

    switch (_selectedIndex) {
      case 0:
        choice = DashboardScreen();
        break;
      case 1:
        choice = PerformanceScreen();
        break;
      case 2:
        choice = TrainingScreen();
        break;
      case 3:
        choice = DatabaseScreen();
        break;
      case 4:
        choice = StoreScreen();
        break;
      case 5:
        choice = NotificationScreen();
        break;
      case 6:
        choice = ProfileScreen();
        break;
      case 7:
        choice = SettingsScreen();
        break;
      default:
        choice = DashboardScreen();
        break;
    }

    return choice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: _decideInteriorBody(),
            ),
          ],
        ),
      ),
    );
  }
}
