
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class AdvertisementCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  AdvertisementCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(AdvertisementContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('adverts', {
      'limit': 10,
      // 'group': null,
      // 'document': null,
    }, (dynamic data) {
      add(AdvertisementContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'link': data['link'],
        },
        'cryptlink': data.id,
      }));
    });
  }
}
