import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class NotificationContent extends DashboardContent {
  static const String Collection_Name = 'notos';

  DateTime date;
  String type, status;

  NotificationContent({
    required this.date,
    required this.type,
    required this.status,
    required title,
    required caption,
    required id,
  })
    : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  NotificationContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.NOTIFICATION,
    'title': title,
    'caption': caption,
    'date': date,
    'type': type,
    'status': status,
    'id': id,
  };
  static NotificationContent fromJson(dynamic data) => NotificationContent(
    title: data['title'],
    caption: data['caption'],
    date: data['date'],
    type: data['type'],
    status: data['status'],
    id: data.id ?? data['id'],
  );

  NotificationContentDisplayPage navigateTo() {
    return NotificationContentDisplayPage(id);
  }

  Widget get icon {
    Color color = Colors.blue;
    String asset = 'assets/icons/google-docs.svg';

    switch (type) {
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
