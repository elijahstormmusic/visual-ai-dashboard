import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class TrainingDataContent extends DashboardContent {
  static const String Collection_Name = 'training_data';

  dynamic training_data;
  String author, encoding_type; // encoding type ->
  DateTime created_on, edited_on;
  int uses;
  bool approved, important, recent;

  TrainingDataContent({
    required this.training_data,
    required this.author,
    required this.encoding_type,
    required this.created_on,
    required this.edited_on,
    required this.uses,
    required this.approved,
    required this.important,
    required this.recent,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  TrainingDataContent.cast(DashboardContent content)
    : super(
      title: content.title,
      caption: content.caption,
      id: content.id,
    )
  { }

  @override
  Map<String, dynamic> toJson() => {
    'type': CONTENT.TRAINING_DATA,
    'title': title,
    'caption': caption,
    'training_data': training_data,
    'author': author,
    'encoding_type': encoding_type,
    'approved': approved,
    'created_on': Timestamp.fromDate(created_on),
    'edited_on': Timestamp.fromDate(edited_on),
    'uses': uses,
    'id': id,
  };
  static TrainingDataContent fromJson(dynamic data) => TrainingDataContent(
    title: data['title'],
    caption: data['caption'],
    training_data: data['training_data'],
    author: data['author'],
    encoding_type: data['encoding_type'],
    approved: data['approved'],
    created: DateTime.parse(data['created'].toDate().toString()),
    edited: DateTime.parse(data['edited'].toDate().toString()),
    uses: data['uses'],
    important: data['uses'] >= 100,
    recent: DateTime.now().subtract(Duration(days: 30)).isBefore(
      DateTime.parse(data['edited'].toDate().toString()),
    ),
    id: data.id ?? data['id'],
  );


  TrainingDataContentDisplayPage navigateTo() {
    return TrainingDataContentDisplayPage(id);
  }

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.training_data_svgs + id + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
