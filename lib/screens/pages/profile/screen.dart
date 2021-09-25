import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/content/profile/cache.dart';
import 'package:visual_ai/content/users/cache.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/constants.dart';

import 'package:visual_ai/screens/components/team/profile_dash.dart';
import 'package:visual_ai/screens/components/team/our_team_members.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProfileCache()),
          ChangeNotifierProvider(create: (context) => UserCache()),
        ],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header('Profile'),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        DashboardProfileDisplay(),
                        if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) OurTeamMembers(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: OurTeamMembers(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
