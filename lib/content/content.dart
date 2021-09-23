import 'package:flutter/material.dart';


enum CONTENT {
  NONE,
  PROFILE,
  STORE_ITEM,
  TRAINING_DATA,
  NOTIFICATION,
  FILE,
  AD,
}

class DashboardContent {

  final String title, caption, cryptlink;
  final Map<String, dynamic> details;

  DashboardContent({
    required this.title,
    required this.caption,
    required this.details,
    required this.cryptlink,
  });

  Widget get icon => Container();
  Widget iconWidget(BuildContext context) => Container();
  Color color(BuildContext context) => Colors.red;
}
