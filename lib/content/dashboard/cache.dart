
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class DashboardCache extends ContentCache<DashboardContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  DashboardContent fromJson(dynamic data) => DashboardContent.fromJson(data);

  void download() async => FirestoreApi.download(
    DashboardContent.CollectionName,
    limit: 10,
    id: FirestoreApi.active_user,
    // id: await FirestoreApi.active_team,
    populate: (dynamic data) => add(
      DashboardContent.fromJson(data),
    ),
  );
}
