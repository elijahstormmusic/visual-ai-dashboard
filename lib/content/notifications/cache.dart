
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class NotificationCache extends ContentCache<NotificationContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  NotificationContent fromJson(dynamic data) => NotificationContent.fromJson(data);

  void download() async => FirestoreApi.download(
    NotificationContent.CollectionName,
    limit: 10,
    id: FirestoreApi.active_user,
    // id: await FirestoreApi.active_team,
    populate: (dynamic data) => add(
      NotificationContent.fromJson(data),
    ),
  );
}
