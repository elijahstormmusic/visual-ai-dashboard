import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class NotificationContent extends DashboardContent {
  NotificationContent(Map<String, dynamic> input)
    : super(
      title: input['title'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  NotificationContentDisplayPage navigateTo() {
    return NotificationContentDisplayPage(cryptlink);
  }

  Widget get icon {
    Color color = Colors.blue;
    String asset = 'assets/icons/google-docs.svg';

    switch (details['type']) {
      case 'account':
      asset = 'assets/icons/user.svg';
      color = Colors.yellow;
      break;
      case 'message':
      asset = 'assets/icons/email.svg';
      color = Colors.purple;
      break;
      case 'important':
      asset = 'assets/icons/danger.svg';
      color = Colors.red;
      break;
      case 'success':
      asset = 'assets/icons/checked.svg';
      color = Colors.green;
      break;
      case 'document':
      asset = 'assets/icons/google-docs.svg';
      color = Colors.blue;
      break;
      default:
      asset = 'assets/icons/google-docs.svg';
      color = Colors.blue;
      break;
    }

    return Container(
      color: color.withOpacity(0.3),
      padding: EdgeInsets.all(6),
      child: SvgPicture.asset(
        asset,
        color: color.withOpacity(0.7),
      ),
    );
  }
}
