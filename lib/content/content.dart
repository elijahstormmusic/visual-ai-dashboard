import 'package:flutter/material.dart';


enum CONTENT {
  NONE,
  PROFILE,
  STORE_ITEM,
  TRAINING_DATA,
  NOTIFICATION,
  AD,
}

class DashboardContent {

  final String text, caption, cryptlink;
  final Map<String, dynamic> details;

  DashboardContent({
    required this.text,
    required this.caption,
    required this.details,
    required this.cryptlink,
  });

  Widget get icon => Container();
}
