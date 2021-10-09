import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class UserCache extends ContentCache<UserContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  UserContent fromJson(dynamic data) => UserContent.fromJson(data);

  String _filter = '';

  void download() => FirestoreApi.download(
    UserContent.CollectionName,
    limit: 10,
    filters: _filter,
    populate: (dynamic data) => add(
      UserContent.fromJson(data),
    ),
  );

  UserCache.friends(String id) {
    _filter = 'id=${id},friends';
  }
  UserCache.non_friends(String id) {
    _filter = 'id=${id},!friends';
  }
  UserCache.team(String id) {
    _filter = 'id=${id},team';
  }
}
