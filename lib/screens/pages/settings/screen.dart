import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/constants.dart';

import 'components/settings_side.dart';
import 'components/settings_main.dart';
import 'components/settings_team.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header('Settings'),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      DashSettingsMain(),
                      SizedBox(height: defaultPadding),
                      DashSettingsTeam(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) DashSettingsSide(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: DashSettingsSide(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
