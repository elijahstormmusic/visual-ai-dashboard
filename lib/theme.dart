import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class MainAppTheme {
  static TextTheme textTheme = TextTheme(
    headline3: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 45.0,
      // fontWeight: FontWeight.w400,
      color: Colors.orange,
    ),
    button: TextStyle(
      // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
      fontFamily: 'OpenSans',
    ),
    caption: TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.deepPurple[300],
    ),
    headline1: TextStyle(fontFamily: 'Quicksand'),
    headline2: TextStyle(fontFamily: 'Quicksand'),
    headline4: TextStyle(fontFamily: 'Quicksand'),
    headline5: TextStyle(fontFamily: 'NotoSans'),
    headline6: TextStyle(fontFamily: 'NotoSans'),
    subtitle1: TextStyle(fontFamily: 'NotoSans'),
    bodyText1: TextStyle(fontFamily: 'NotoSans'),
    bodyText2: TextStyle(fontFamily: 'NotoSans'),
    subtitle2: TextStyle(fontFamily: 'NotoSans'),
    overline: TextStyle(fontFamily: 'NotoSans'),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.red,
    buttonColor: Colors.blue,
    shadowColor: Colors.black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.red),
    fontFamily: 'SourceSansPro',
    textTheme: textTheme,
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.orange,
    buttonColor: Colors.purple,
    shadowColor: Colors.white.withOpacity(.20),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orange),
    fontFamily: 'SourceSansPro',
    textTheme: textTheme,
  );
}


class ThemeSwitcher extends StatelessWidget {

  Widget child = Container();

  ThemeSwitcher({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StoreBuilder( // Would use a StoreConnector & ViewModel in the real world
      builder: (BuildContext context, Store<AppState> store) {
        final state = store.state;
        return GestureDetector(
          onTap: () => store.dispatch(UpdateDarkMode(enable: !state.enableDarkMode)),
          child: child,
        );
      },
    );
  }
}

  // redux
class AppState {
  AppState({required this.enableDarkMode});
  bool enableDarkMode;
}

class UpdateDarkMode {
  UpdateDarkMode({required this.enable});
  final bool enable;
}

AppState reducer(AppState state, dynamic action) {
  if (action is UpdateDarkMode) {
    return AppState(
      enableDarkMode: action.enable,
    );
  }

  return state;
}
