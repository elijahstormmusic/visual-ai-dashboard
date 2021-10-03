import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class StoreContent extends DashboardContent {
  static const String Collection_Name = 'store';

  String type, keywords;
  int size, num_of_likes, num_of_purchases;
  bool purchased, popular, recent;

  StoreContent({
    required this.type,
    required this.keywords,
    required this.size,
    required this.num_of_likes,
    required this.num_of_purchases,
    required this.purchased,
    required this.popular,
    required this.recent,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  StoreContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.STORE_ITEM,
    'title': title,
    'caption': caption,
    'type': type,
    'size': size,
    'keywords': keywords,
    'popular': popular,
    'recent': recent,
    'num_of_purchases': num_of_purchases,
    'num_of_likes': num_of_likes,
    'id': id,
  };
  static StoreContent fromJson(dynamic data) => StoreContent(
    title: data['title'],
    caption: data['caption'],
    type: data['type'],
    size: data['size'],
    keywords: data['keywords'],
    purchased: true,
    popular: data['popular'],
    recent: data['recent'],
    num_of_purchases: data['num_of_purchases'],
    num_of_likes: data['num_of_likes'],
    id: data.id ?? data['id'],
  );

  StoreContentDisplayPage navigateTo() {
    return StoreContentDisplayPage(id);
  }

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.store_items_svgs + id + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
