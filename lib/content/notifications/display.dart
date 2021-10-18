import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';

import 'content.dart';


class NotificationContentDisplayPage extends StatelessWidget {
  final NotificationContent cryptlink;

  NotificationContentDisplayPage(this.cryptlink);

  Widget build(BuildContext context) {
    return BackablePage(
      child: Column(
        children: [
          Text('hey hey heys'),
        ],
      ),
    );
  }
}
