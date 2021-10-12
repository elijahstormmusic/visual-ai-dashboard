import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';

import 'content.dart';

import 'components/main.dart';


class StoreContentDisplayPage extends StatelessWidget {
  final StoreContent content;

  StoreContentDisplayPage(this.content);

  Widget build(BuildContext context) {

    print(content.title);
    print(content.caption);
    print(content.id);

    return BackablePage(
      child: Center(
        child: HomePage(),
      ),
    );
  }
}
