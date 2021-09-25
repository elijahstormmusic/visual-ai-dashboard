
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
      // 'group': null,
      // 'document': null,
    }, (dynamic data) {
      add(StoreContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'type': data['type'],
          'size': data['size'],
          'keywords': data['keywords'],
          'purchased': true,
          'popular': data['details']['popular'],
          'recent': data['details']['recent'],
          'num_of_purchases': data['details']['purchases'],
          'likes': data['details']['likes'],
        },
        'cryptlink': data.id,
      }));
    });
  }
}
