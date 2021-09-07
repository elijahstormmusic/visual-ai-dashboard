import 'package:flutter/material.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class AdvertisementContent extends DashboardContent {
  AdvertisementContent(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }
  
  UserContentDisplayPage navigateTo() {
    return UserContentDisplayPage(cryptlink);
  }
}
