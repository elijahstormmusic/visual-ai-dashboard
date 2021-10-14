import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/controllers/menu_controller.dart';
import 'package:visual_ai/responsive.dart';
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
  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<MainScreen> {

  ValueNotifier<String> _stateIndexNotifier = ValueNotifier('Dashboard');

  Widget _decideInteriorBody() {
    var choice;

    switch (_stateIndexNotifier.value) {
      case 'Dashboard':
        choice = DashboardScreen();
        break;
      case 'Performance':
        choice = PerformanceScreen();
        break;
      case 'Training':
        choice = TrainingScreen();
        break;
      case 'Database':
        choice = DatabaseScreen();
        break;
      case 'Store':
        choice = StoreScreen();
        break;
      case 'Notification':
        choice = NotificationScreen();
        break;
      case 'Profile':
        choice = ProfileScreen();
        break;
      case 'Settings':
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
      drawer: Responsive.isDesktop(context) ? null : SideMenu(_stateIndexNotifier),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(_stateIndexNotifier),
            ),
          Expanded(
            flex: 5,
            child: ValueListenableBuilder<String>(
              valueListenable: _stateIndexNotifier,
              builder: (context, value, child) {
                return _decideInteriorBody();
              },
            ),
          ),
        ],
      ),
    );
  }
}
