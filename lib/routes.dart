import 'package:flutter/material.dart';

import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/pages/404/page.dart';
import 'package:visual_ai/pages/settings/page.dart';
import 'package:visual_ai/pages/permissions/page.dart';
import 'package:visual_ai/pages/billing/page.dart';


class Routes {
  static String initalRoute = UI_Manager.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    UI_Manager.routeName: (context) => UI_Manager(),
    PermissionsPage.routeName: (context) => PermissionsPage(),
    BillingPage.routeName: (context) => BillingPage(),
    AccountSettingsPage.routeName: (context) => AccountSettingsPage(),
  };

  static Route<dynamic> unknownRoute(RouteSettings settings) => MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => PageNotFound(),
  );
}
