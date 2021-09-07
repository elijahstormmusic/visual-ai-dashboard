
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:visual_ai/login/login_screen.dart';
import 'package:visual_ai/login/transition_route_observer.dart';
import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/theme.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/ui_manager.dart';


void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     systemNavigationBarColor:
  //         SystemUiOverlayStyle.dark.systemNavigationBarColor,
  //   ),
  // );
  //

  final store = Store<AppState>(
    reducer,
    distinct: true,
    initialState: AppState(enableDarkMode: false),
  );

  runApp(StoreProvider<AppState>(
    store: store,
    child: DashboardApp(),
  ));
}


class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    dynamic launchState = LoginScreen();
    String _initialRoute = LoginScreen.routeName;

    if (UserState.User != '') {
      launchState = UI_Manager();
      _initialRoute = UI_Manager.routeName;
    }

    if (
      !kReleaseMode &&
      AppDebugLogin.bypass
    ) {
      launchState = UI_Manager();
      _initialRoute = UI_Manager.routeName;

      UserState.User = AppDebugLogin.username;
      UserState.Auth = AppDebugLogin.password;
      UserState.Pic = '''https://avatars.dicebear.com/api/human/${
        AppDebugLogin.username.substring(0, AppDebugLogin.username.indexOf('@'))
      }.svg''';
    }

    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (store) => store.state.enableDarkMode,
      builder: (_, bool enableDarkMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'V.AI Admin Panel',
          // theme: MainAppTheme.light,
          // darkTheme: MainAppTheme.dark,
          // themeMode: enableDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          home: launchState,
          initialRoute: _initialRoute,
          navigatorObservers: [TransitionRouteObserver()],
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            UI_Manager.routeName: (context) => UI_Manager(),
          },
        );
      },
    );
  }
}
