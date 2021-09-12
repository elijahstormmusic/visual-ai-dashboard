import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:visual_ai/firestore/firestore.dart';
import 'package:visual_ai/login/login_screen.dart';
import 'package:visual_ai/login/transition_route_observer.dart';
import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/theme.dart';
import 'package:visual_ai/pages/404/error.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/content/cache.dart';


void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     systemNavigationBarColor:
  //         SystemUiOverlayStyle.dark.systemNavigationBarColor,
  //   ),
  // );
  //
  await Firebase.initializeApp();

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

    if (
      !kReleaseMode &&
      AppDebugLogin.bypass
    ) { // lanching in debug mode
      ContentCache.Load_Mock_Data = true;
      UserState.Load_Mock_Data = true;
      FirestoreApi.Disabled = true;
    }

    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (store) => store.state.enableDarkMode,
      builder: (_, bool enableDarkMode) {
        return MaterialApp(
          // unknownRoute: GetPage(name: '/not-found', page: () => PageNotFound(), transition: Transition.fadeIn),
          debugShowCheckedModeBanner: false,
          title: '${Constants.appName} | ${Constants.appTitleDesc}',
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
            cardColor: cardColorLight,
            scaffoldBackgroundColor: bgColorLight,
            primaryColor: primaryColorLight,
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
            cardColor: cardColorDark,
            scaffoldBackgroundColor: bgColorDark,
            primaryColor: primaryColorDark,
          ),
          themeMode: enableDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: UI_Manager.routeName,
          routes: {
            UI_Manager.routeName: (context) => UI_Manager(),
          },
        );
      },
    );
  }
}
