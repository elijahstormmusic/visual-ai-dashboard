import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';

import 'content.dart';


class UserContentDisplayPage extends StatelessWidget {
  final UserContent content;

  UserContentDisplayPage(this.content);

  Widget build(BuildContext context) {
    return BackablePage(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
