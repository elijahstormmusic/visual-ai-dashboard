
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
        add(NotificationContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('notos', {
      'limit': 10,
      'group': 'group0',
      'document': FirestoreApi.logged_in_user_id,
    }, (dynamic data) {
      add(NotificationContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'date': DateTime.parse(data['date'].toDate().toString()),
          'type': data['type'],
          'status': data['status'],
        },
        'cryptlink': data.id,
      }));
    });
  }
}
