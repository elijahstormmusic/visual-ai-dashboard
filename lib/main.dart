import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:visual_ai/firestore/firestore.dart';
import 'package:visual_ai/login/login_screen.dart';
import 'package:visual_ai/login/transition_route_observer.dart';
import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/content/cache.dart';

import 'package:visual_ai/theme.dart';
import 'package:visual_ai/routes.dart';
import 'package:visual_ai/constants.dart';


void main() async {
  if (
    !kReleaseMode &&
    AppDebugLogin.bypass
  ) { // lanching in debug mode
    ContentCache.Load_Mock_Data = true;
    UserState.Load_Mock_Data = true;
    FirestoreApi.Disabled = true;
  }

  runApp(await Themes.init(DashboardApp()));
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (store) => store.state.enableDarkMode,
      builder: (_, bool enableDarkMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '${Constants.appName} | ${Constants.appTitleDesc}',
          theme: Themes.mainLightThem(context),
          darkTheme: Themes.mainDarkThem(context),
          themeMode: enableDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: Routes.initalRoute,
          routes: Routes.routes,
          onUnknownRoute: Routes.unknownRoute,
        );
      },
    );
  }
}
