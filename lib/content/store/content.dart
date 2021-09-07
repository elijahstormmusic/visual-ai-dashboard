import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class StoreContent extends DashboardContent {
  StoreContent(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  StoreContentDisplayPage navigateTo() {
    return StoreContentDisplayPage(cryptlink);
  }

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.store_items_svgs + cryptlink + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
