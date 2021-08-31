import 'package:flutter/material.dart';

import 'package:visual_ai/constants.dart';


enum CONTENT {
  NONE,
  PROFILE,
  AD,
}

class SwipeableContent {

  final String text;
  final String caption;
  final List<String> pictures;
  final String sex;
  final bool online;
  final bool verified;
  final String cryptlink;

  SwipeableContent({
    required this.text,
    required this.caption,
    required this.pictures,
    required this.sex,
    required this.online,
    required this.verified,
    required this.cryptlink,
  });

  void action() {

  }

  Widget get images {
    List<String> list = [];

    for (int i=0;i<pictures.length;i++) {
      list.add(Constants.demo_source + pictures[i]);
    }

    return PageView.builder(
      itemCount: list.length,
      controller: PageController(viewportFraction: 1),
      itemBuilder: (_, i) {
        return Container(
          child: Image.asset(
            list[i],
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }

  Widget get icon => Container(
    child: Image.asset(
      Constants.demo_source + pictures[0],
      fit: BoxFit.fill,
    ),
  );
}
