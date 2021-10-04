import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class UserContent extends ContentContainer {
  static const String CollectionName = 'users';
  String get collection => CollectionName;

  String image, sex;
  bool online, verified, team_member, friend;
  DateTime created_on, last_login;

  UserContent({
    required this.image,
    required this.sex,
    required this.online,
    required this.verified,
    required this.team_member,
    required this.friend,
    required this.created_on,
    required this.last_login,
    required title,
    required caption,
    required id,
  }) : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  factory UserContent.fromJson(dynamic data) => UserContent(
    title: data['title'],
    caption: data['caption'],
    image: data['image'],
    sex: data['sex'],
    online: data['online'],
    verified: data['verified'],
    team_member: true,
    friend: true,
    created_on: data['created_on'].toDate(),
    last_login: data['last_login'].toDate(),
    id: data.id ?? data['id'],
  );

  Map<String, dynamic> toJson() => {
    'type': CONTENT.USER,
    'title': title,
    'caption': caption,
    'image': image,
    'sex': sex,
    'online': online,
    'verified': verified,
    'created_on': Timestamp.fromDate(created_on),
    'last_login': Timestamp.fromDate(last_login),
    'id': id,
  };

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.live_svgs + id + '.svg',
      fit: BoxFit.fill,
    ),
  );

  UserContentDisplayPage navigateTo() {
    return UserContentDisplayPage(id);
  }
}
