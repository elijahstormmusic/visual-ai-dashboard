import 'package:flutter/material.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class AdvertisementContent extends ContentContainer {
  static const String CollectionName = 'adverts';
  String get collection => CollectionName;
  final content_type = CONTENT.AD;

  String link;

  AdvertisementContent({
    required this.link,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  factory AdvertisementContent.fromJson(dynamic data) => AdvertisementContent(
    title: data['title'],
    caption: data['caption'],
    link: data['link'],
    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'link': link,
  };

  UserContentDisplayPage navigateTo() {
    return UserContentDisplayPage(id);
  }
}
