import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class FileContent extends DashboardContent {
  static const String Collection_Name = 'files';

  String cloud_link;
  int file_type;
  DateTime created_on, last_edit;

  FileContent({
    required this.cloud_link,
    required this.file_type,
    required this.created_on,
    required this.last_edit,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  FileContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.FILE,
    'title': title,
    'caption': caption,
    'cloud_link': cloud_link,
    'file_type': file_type,
    'created_on': Timestamp.fromDate(created_on),
    'last_edit': Timestamp.fromDate(last_edit),
    'id': id,
  };
  static FileContent fromJson(dynamic data) => FileContent(
    title: data['title'],
    caption: data['caption'],
    cloud_link: data['cloud_link'],
    file_type: data['file_type'],
    created_on: data['created_on'].toDate(),
    last_edit: data['last_edit'].toDate(),
    id: data.id ?? data['id'],
  );

  FileContentDisplayPage navigateTo() {
    return FileContentDisplayPage(id);
  }

  Widget get icon {
    String asset = 'assets/icons/doc_file.svg';

    switch (file_type) {
      case 0:
        asset = 'assets/icons/xd_file.svg';
        break;
      case 1:
        asset = 'assets/icons/Figma_file.svg';
        break;
      case 2:
        asset = 'assets/icons/doc_file.svg';
        break;
      case 3:
        asset = 'assets/icons/sound_file.svg';
        break;
      case 4:
        asset = 'assets/icons/media_file.svg';
        break;
      case 5:
        asset = 'assets/icons/pdf_file.svg';
        break;
      case 6:
        asset = 'assets/icons/excle_file.svg';
        break;
      default:
        asset = 'assets/icons/doc_file.svg';
        break;
    }

    return SvgPicture.asset(
      asset,
    );
  }
}
