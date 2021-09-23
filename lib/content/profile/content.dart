import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class ProfileContent extends DashboardContent {
  ProfileContent(Map<String, dynamic> input)
    : super(
      title: input['title'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  ProfileContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      details: content.details,
      cryptlink: content.cryptlink,
    )
  { }

  ProfileContentDisplayPage navigateTo() {
    return ProfileContentDisplayPage(cryptlink);
  }

  Color color(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    switch (details['fileSource']) {
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

    if (details['type'] == 'overview') {
      switch (details['fileSource']) {
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

    else if (details['type'] == 'storage') {
      switch (details['mediaType']) {
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
