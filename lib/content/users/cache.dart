
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class UserCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  UserCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(UserContent.fromJson(list[i]));
      }

      return;
    }

    FirestoreApi.download(
      UserContent.Collection_Name,
      limit: 10,
      populate: (dynamic data) => add(
        TrainingDataContent.fromJson(data),
      ),
    );
  }
}
