import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class TeamCache extends ContentCache<TeamContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  TeamContent fromJson(dynamic data) => TeamContent.fromJson(data);

  String _filter = '';

  void download() => FirestoreApi.download(
    TeamContent.CollectionName,
    limit: 10,
    filters: _filter,
    is_team: true,
    populate: (dynamic data) => add(
      TeamContent.fromJson(data),
    ),
  );
}
