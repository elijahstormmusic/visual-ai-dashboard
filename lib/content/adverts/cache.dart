
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class AdvertisementCache extends ContentCache<AdvertisementContent> {
  List<Map<String, dynamic>> get mockData => MockContent.all;
  AdvertisementContent fromJson(dynamic data) => AdvertisementContent.fromJson(data);

  void download() => FirestoreApi.download(
    AdvertisementContent.CollectionName,
    limit: 10,
    populate: (dynamic data) => add(
      AdvertisementContent.fromJson(data),
    ),
  );
}
