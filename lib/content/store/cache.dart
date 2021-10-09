
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class StoreCache extends ContentCache<StoreContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  StoreContent fromJson(dynamic data) => StoreContent.fromJson(data);

  void download() => FirestoreApi.download(
    StoreContent.CollectionName,
    limit: 10,
    populate: (dynamic data) => add(
      StoreContent.fromJson(data),
    ),
  );
}
