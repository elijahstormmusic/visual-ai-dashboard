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
  final content_type = CONTENT.STORE_ITEM;

  final String type, keywords;
  final double price;
  final int size, num_of_likes, num_of_purchases;
  final DateTime released;

  StoreContent({
    required this.type,
    required this.keywords,
    required this.price,
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
    keywords: data['keywords'],
    price: data['price'],
    size: data['size'],
    num_of_likes: data['num_of_likes'],
    num_of_purchases: data['num_of_purchases'],
    released: DateTime.parse(data['released'].toDate().toString()),
    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'type': type,
    'keywords': keywords,
    'price': price,
    'size': size,
    'num_of_likes': num_of_likes,
    'num_of_purchases': num_of_purchases,
    'released': Timestamp.fromDate(released),
  };

  StoreContentDisplayPage navigateTo() {
    return StoreContentDisplayPage(this);
  }


  bool get purchased => true;
  bool get popular => true;
  bool get recent => released.isAfter(DateTime.now().subtract(Duration(days: 14)));

  String get released_str => Constants.timeSinceDate(released);
  String get price_str => '\$${((price*100.0).floor().toDouble()/100.0).toString()}';
  Widget get icon => Hero(
    tag: id,
    child: Container(
      child: SvgPicture.network(
        Constants.store_items_svgs + id + '.svg',
        fit: BoxFit.fill,
      ),
    ),
  );
}
