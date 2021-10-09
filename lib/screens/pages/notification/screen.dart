import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/content/notifications/cache.dart';
import 'package:visual_ai/content/users/cache.dart';
import 'package:visual_ai/firestore/firestore.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/screens/components/team/recommended_friends.dart';
import 'package:visual_ai/screens/components/notifications/recent_friend_activity.dart';
import 'package:visual_ai/screens/components/notifications/recent_notifications.dart';
import 'package:visual_ai/constants.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NotificationCache()),
          ChangeNotifierProvider(create: (context) => UserCache.non_friends(FirestoreApi.active_user ?? '')),
        ],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header('Notification'),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        RecentNotifications(),
                        SizedBox(height: defaultPadding),
                        RecentFriendActivities(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) RecommendedFriends(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: RecommendedFriends(),
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
