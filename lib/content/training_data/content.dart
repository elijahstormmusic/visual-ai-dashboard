import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class TrainingDataContent extends ContentContainer {
  static const String CollectionName = 'training_data';
  String get collection => CollectionName;
  final content_type = CONTENT.TRAINING_DATA;

  dynamic training_data;
  String encoding_type, author, image_link;
  DateTime created_on, edited_on;
  int uses;
  bool approved;

  TrainingDataContent({
    required this.training_data,
    required this.encoding_type,
    required this.author,
    required this.image_link,
    required this.created_on,
    required this.edited_on,
    required this.uses,
    required this.approved,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  factory TrainingDataContent.fromJson(dynamic data) => TrainingDataContent(
    title: data['title'],
    caption: data['caption'],
    training_data: data['training_data'],
    encoding_type: data['encoding_type'],
    author: data['author'],
    image_link: data['image_link'],
    approved: data['approved'],
    created_on: DateTime.parse(data['created_on'].toDate().toString()),
    edited_on: DateTime.parse(data['edited_on'].toDate().toString()),
    uses: data['uses'],
    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'training_data': training_data,
    'encoding_type': encoding_type,
    'author': author,
    'image_link': image_link,
    'approved': approved,
    'created_on': Timestamp.fromDate(created_on),
    'edited_on': Timestamp.fromDate(edited_on),
    'uses': uses,
  };


  TrainingDataContentDisplayPage navigateTo() {
    return TrainingDataContentDisplayPage(id);
  }

  bool get important => uses >= 100;
  bool get recent => edited_on.isAfter(DateTime.now().subtract(Duration(days: 14)));

  bool find(String query) {
    if (query.contains('important') && important)
      return true;
    if (query.contains('recent') && recent)
      return true;
    return encoding_type.contains(query);
  }

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.training_data_svgs + id + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
