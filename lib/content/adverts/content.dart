import 'package:flutter/material.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class AdvertisementContent extends DashboardContent {
  static const String Collection_Name = 'adverts';

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

  AdvertisementContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.AD,
    'title': title,
    'caption': caption,
    'link': link,
    'id': id,
  };
  static AdvertisementContent fromJson(dynamic data) => AdvertisementContent(
    title: data['title'],
    caption: data['caption'],
    link: data['link'],
    id: data.id ?? data['id'],
  );

  UserContentDisplayPage navigateTo() {
    return UserContentDisplayPage(id);
  }
}
