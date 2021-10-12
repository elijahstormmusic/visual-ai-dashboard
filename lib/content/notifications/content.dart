import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class NotificationContent extends ContentContainer {
  static const String CollectionName = 'notos';
  String get collection => CollectionName;
  final content_type = CONTENT.NOTIFICATION;

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

  factory NotificationContent.fromJson(dynamic data) => NotificationContent(
    title: data['title'],
    caption: data['caption'],
    date: data['date'].toDate(),
    type: data['type'],
    status: data['status'],
    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'date': Timestamp.fromDate(date),
    'type': type,
    'status': status,
  };

  NotificationContentDisplayPage navigateTo() {
    return NotificationContentDisplayPage(this);
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
