import 'package:flutter/material.dart';


enum CONTENT {
  NONE,
  PROFILE,
  STORE_ITEM,
  TRAINING_DATA,
  NOTIFICATION,
  FILE,
  USER,
  AD,
}

class DashboardContent {

  final String title, caption, id;

  DashboardContent({
    required this.title,
    required this.caption,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    'type': CONTENT.NONE,
    'title': title,
    'caption': caption,
    'id': id,
  };
  DashboardContent fromJson(dynamic data) => DashboardContent(
    title: data['title'],
    caption: data['caption'],
    id: data['id'],
  );

  Widget get icon => Container();
  Widget iconWidget(BuildContext context) => Container();
  Color color(BuildContext context) => Colors.red;
}
