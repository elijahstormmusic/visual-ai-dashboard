import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';


enum CONTENT {
  NONE,
  PROFILE,
  AD,
}

class DashboardContent {

  final String text, caption, sex, cryptlink;
  // final List<String> pictures;
  final bool online, verified;

  DashboardContent({
    required this.text,
    required this.caption,
    // required this.picture,
    required this.sex,
    required this.online,
    required this.verified,
    required this.cryptlink,
  });

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.live_svgs + cryptlink + '.svg',
      fit: BoxFit.fill,
    ),
    // child: Image.asset(
    //   Constants.demo_source + pictures[0],
    //   fit: BoxFit.fill,
    // ),
  );
}
