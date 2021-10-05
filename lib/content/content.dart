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

class ContentContainer {
  static const String CollectionName = '';
  String get collection => CollectionName;

  final String title, caption, id;

  ContentContainer({
    required this.title,
    required this.caption,
    required this.id,
  });

  ContentContainer.fromJson(dynamic data) :
    title = data['title'],
    caption = data['caption'],
    id = data['id'];

  Map<String, dynamic> toJson() => {
    'type': CONTENT.NONE,
    'title': title,
    'caption': caption,
    'id': id,
  };

  bool find(String query) {
    return title.contains(query) || caption.contains(query) || id == query;
  }
}
