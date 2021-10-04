
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class FileCache extends ContentCache<FileContent> {
  List<Map<String, dynamic> > get mockData => MockContent.all;
  FileContent fromJson(dynamic data) => FileContent.fromJson(data);

  void download() async => FirestoreApi.download(
    FileContent.CollectionName,
    limit: 10,
    id: FirestoreApi.active_user,
    // id: await FirestoreApi.active_team,
    populate: (dynamic data) => add(
      FileContent.fromJson(data),
    ),
  );
}
