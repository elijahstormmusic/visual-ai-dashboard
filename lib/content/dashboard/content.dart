import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class DashboardContent extends ContentContainer {
  static const String CollectionName = 'dashboard';
  String get collection => CollectionName;
  final CONTENT = CONTENT.DASHBOARD;

  String type;
  Map<String, dynamic> data;

  DashboardContent({
    required this.type,
    required this.data,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  Map<String, dynamic> toJson() => {
    '.dashboard.type': CONTENT.PROFILE,
    'title': title,
    'caption': caption,
    'type': type,
    'data': data,
    'id': id,
  };
  static dynamic fromJson(dynamic data) => DashboardContent(
    title: data['title'],
    caption: data['caption'],
    type: data['type'],
    data: data['data'],
  );

  bool find(String query) {
    return type == query;
  }

  DashboardContentDisplayPage navigateTo() {
    return DashboardContentDisplayPage(id);
  }

  Color color(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    switch (data['file_source']) {
      case 'document':
        color = Theme.of(context).primaryColor;
        break;
      case 'google':
        color = Color(0xFFFFA113);
        break;
      case 'one drive':
        color = Color(0xFFA4CDFF);
        break;
      case 'dropbox':
        color = Color(0xFF007EE5);
        break;
      default:
        color = Theme.of(context).primaryColor;
        break;
    }

    return color;
  }

  Widget get icon {
    String asset = 'assets/icons/Documents.svg';
    Color? color;

    if (type == 'overview') {
      switch (data['file_source']) {
        case 'document':
          asset = 'assets/icons/Documents.svg';
          break;
        case 'google':
          asset = 'assets/icons/google_drive.svg';
          color = Color(0xFFFFA113);
          break;
        case 'one drive':
          asset = 'assets/icons/one_drive.svg';
          color = Color(0xFFA4CDFF);
          break;
        case 'dropbox':
          asset = 'assets/icons/drop_box.svg';
          color = Color(0xFF007EE5);
          break;
        default:
          asset = 'assets/icons/Documents.svg';
          break;
      }
    }

    else if (type == 'storage') {
      switch (data['file_source']) {
        case 'document':
          asset = 'assets/icons/Documents.svg';
          break;
        case 'media':
          asset = 'assets/icons/media.svg';
          color = Color(0xFF26E5FF);
          break;
        case 'other':
          asset = 'assets/icons/folder.svg';
          color = Color(0xFFFFCF26);
          break;
        case 'unknown':
          asset = 'assets/icons/unknown.svg';
          color = Color(0xFFEE2727);
          break;
        default:
          asset = 'assets/icons/Documents.svg';
          break;
      }
    }

    return SvgPicture.asset(
      asset,
      color: color,
    );
  }
}
