
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class StoreCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  StoreCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(StoreContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('store', {
      'limit': 10,
      'group': null,
      'userId': '4ctc1i9v3NUbebM1iNzNs10hDci1',
    }, (dynamic data) {
      add(StoreContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {

        },
        'cryptlink': data.id,
      }));
    });
  }
}
