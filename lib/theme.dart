import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:visual_ai/constants.dart';


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
