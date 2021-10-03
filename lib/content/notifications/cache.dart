
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class NotificationCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  NotificationCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(NotificationContent.fromJson(list[i]));
      }

      return;
    }

    FirestoreApi.download(
      NotificationContent.Collection_Name,
      limit: 10,
      team_id: FirestoreApi.active_team,
      user_id: FirestoreApi.active_user,
      populate: (dynamic data) => add(
        NotificationContent.fromJson(data),
      ),
    );
  }
}
