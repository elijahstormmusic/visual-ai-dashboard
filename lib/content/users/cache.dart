
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class UserCache extends ContentCache<UserContent> {
  List<Map<String, dynamic> > get mockData => MockContent.all;
  UserContent fromJson(dynamic data) => UserContent.fromJson(data);

  void download() => FirestoreApi.download(
    UserContent.CollectionName,
    limit: 10,
    populate: (dynamic data) => add(
      UserContent.fromJson(data),
    ),
  );
}
