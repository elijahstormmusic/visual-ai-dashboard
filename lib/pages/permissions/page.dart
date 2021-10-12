import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';


class PermissionsPage extends StatelessWidget {
  static const routeName = '/permissions';

  @override
  Widget build(BuildContext context) {
    return BackablePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(routeName),
        ],
      ),
    );
  }
}
