
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class TrainingDataCache extends ContentCache<TrainingDataContent> {
  List<Map<String, dynamic> > get mockData => MockContent.all;
  TrainingDataContent fromJson(dynamic data) => TrainingDataContent.fromJson(data);

  void download() async => FirestoreApi.download(
    TrainingDataContent.CollectionName,
    limit: 25,
    id: FirestoreApi.active_user,
    // id: await FirestoreApi.active_team,
    populate: (dynamic data) => add(
      TrainingDataContent.fromJson(data),
    ),
  );
}
