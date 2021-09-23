import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class StoreContent extends DashboardContent {
  StoreContent(Map<String, dynamic> input)
    : super(
      title: input['title'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  StoreContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      details: content.details,
      cryptlink: content.cryptlink,
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
