import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class ProfileContent extends DashboardContent {
  static const String Collection_Name = 'profile';

  String type, total_storage, file_source;
  int num_of_files, percentage;

  ProfileContent({
    required this.type,
    required this.total_storage,
    required this.file_source,
    required this.num_of_files,
    required this.percentage,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  ProfileContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.PROFILE,
    'title': title,
    'caption': caption,
    'type': type,
    'file_source': file_source,
    'num_of_files': num_of_files,
    'total_storage': total_storage,
    'percentage': percentage,
    'id': id,
  };
  static ProfileContent fromJson(dynamic data) => ProfileContent(
    title: data['title'],
    caption: data['caption'],
    type: data['type'],
    file_source: data['file_source'],
    num_of_files: data['num_of_files'],
    total_storage: data['total_storage'],
    percentage: data['percentage'],
    id: data.id ?? data['id'],
  );

  ProfileContentDisplayPage navigateTo() {
    return ProfileContentDisplayPage(id);
  }

  Color color(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    switch (file_source) {
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

  @override
  Widget get icon {
    String asset = 'assets/icons/Documents.svg';
    Color? color;

    if (type == 'overview') {
      switch (file_source) {
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
      switch (type) {
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
