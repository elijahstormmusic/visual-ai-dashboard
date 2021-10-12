import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';


class BillingPage extends StatelessWidget {
  static const routeName = '/billing';

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
