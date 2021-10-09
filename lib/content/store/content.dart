import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class StoreContent extends ContentContainer {
  static const String CollectionName = 'store';
  String get collection => CollectionName;
  final CONTENT = CONTENT.STORE_ITEM;

  String type, keywords;
  int size, num_of_likes, num_of_purchases;
  DateTime released;

  StoreContent({
    required this.type,
    required this.keywords,
    required this.size,
    required this.num_of_likes,
    required this.num_of_purchases,
    required this.released,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  factory StoreContent.fromJson(dynamic data) => StoreContent(
    title: data['title'],
    caption: data['caption'],
    type: data['type'],
    size: data['size'],
    keywords: data['keywords'],
    num_of_likes: data['num_of_likes'],
    num_of_purchases: data['num_of_purchases'],
    released: DateTime.parse(data['released'].toDate().toString()),
    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'type': type,
    'size': size,
    'keywords': keywords,
    'num_of_likes': num_of_likes,
    'num_of_purchases': num_of_purchases,
    'released': Timestamp.fromDate(released),
  };

  StoreContentDisplayPage navigateTo() {
    return StoreContentDisplayPage(id);
  }


  bool get purchased => true;
  bool get popular => true;
  bool get recent => released.isAfter(DateTime.now().subtract(Duration(days: 14)));


  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.store_items_svgs + id + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
