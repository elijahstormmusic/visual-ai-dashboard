import 'package:flutter/material.dart';

import 'partner.dart';
import 'display.dart';

import 'package:visual_ai/constants.dart';


class Sale {
  static final String source =
    Constants.media_source;
  static final String default_img =
    Constants.media_source + 'loading/explore_card.jpg';

  final String cryptlink;
  final String name;
  final String info;
  final String pic;
  final Partner partner;


  Sale({
    required this.cryptlink,
    required this.name,
    required this.info,
    required this.pic,
    required this.partner,
  });

  NetworkImage card_image() {
    if (pic==null) return NetworkImage(Sale.default_img);
    return NetworkImage(Sale.source + pic);
  }
  Widget image() {
    if (pic==null) return Image.asset('assets/loading/Bucket-1s-200px.gif');
    return Image.network(Sale.source + pic);
  }
  String media_href() {
    if (pic==null) return Sale.default_img;
    return Sale.source + pic;
  }

  static Sale json(var data) {
    return Sale(
      cryptlink: data['link'],
      name: data['name'],
      info: data['info'],
      pic: data['cloud'],
      partner: Partner.link(data['partner']),
    );
  }
  PartnerDisplayPage navigateTo() {
    return PartnerDisplayPage(partner.cryptlink);
  }
}
