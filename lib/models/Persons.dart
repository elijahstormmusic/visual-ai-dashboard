import 'package:visual_ai/constants.dart';
import 'package:flutter/material.dart';

class PersonInfo {
  final String? svgSrc, name;
  final Color? color;

  PersonInfo({
    this.svgSrc,
    this.name,
    this.color,
  });
}

List demoPeople = [
  PersonInfo(
    svgSrc: 'https://avatars.dicebear.com/api/human/Documents.svg',
    name: 'Documents',
    color: primaryColor,
  ),
  PersonInfo(
    svgSrc: 'https://avatars.dicebear.com/api/human/Google.svg',
    name: 'Google Drive',
    color: Color(0xFFFFA113),
  ),
  PersonInfo(
    svgSrc: 'https://avatars.dicebear.com/api/human/Drive.svg',
    name: 'One Drive',
    color: Color(0xFFA4CDFF),
  ),
  PersonInfo(
    svgSrc: 'https://avatars.dicebear.com/api/human/Person.svg',
    name: 'Documents',
    color: Color(0xFF007EE5),
  ),
];
