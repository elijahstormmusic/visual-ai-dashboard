import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:visual_ai/constants.dart';


class ThemeSwitcher extends StatelessWidget {

  Widget child = Container();

  ThemeSwitcher({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AppState> store) {
        final state = store.state;
        return GestureDetector(
          onTap: () => store.dispatch(
            UpdateDarkMode(enable: !state.enableDarkMode),
          ),
          child: child,
        );
      },
    );
  }
}

class Themes {
  static Future<StoreProvider<AppState>> init(Widget mainApp) async {
    return StoreProvider<AppState>(
      store: Store<AppState>(
        reducer,
        distinct: true,
        initialState: AppState(
          enableDarkMode: (
             await (
              await SharedPreferences.getInstance()
            ).getBool('darkMode')
          ) ?? false,
        ),
      ),
      child: mainApp,
    );
  }

  static ThemeData mainLightThem(BuildContext context) => ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      .apply(bodyColor: Colors.black),
    cardColor: cardColorLight,
    scaffoldBackgroundColor: bgColorLight,
    primaryColor: primaryColorLight,
  );
  static ThemeData mainDarkThem(BuildContext context) => ThemeData.dark().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      .apply(bodyColor: Colors.white),
    cardColor: cardColorDark,
    scaffoldBackgroundColor: bgColorDark,
    primaryColor: primaryColorDark,
  );
}

  // redux
class AppState {
  AppState({required this.enableDarkMode});
  bool enableDarkMode;
}

class UpdateDarkMode {
  final bool enable;

  UpdateDarkMode({required this.enable}) {
    _persistTheme();
  }

  void _persistTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', enable);
  }
}

AppState reducer(AppState state, dynamic action) {
  if (action is UpdateDarkMode) {
    return AppState(
      enableDarkMode: action.enable,
    );
  }

  return state;
}
