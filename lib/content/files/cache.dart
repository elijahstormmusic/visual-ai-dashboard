
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class FileCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  FileCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(FileContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('files', {
      'limit': 10,
      'group': 'group0',
      'document': FirestoreApi.logged_in_user_id,
    }, (dynamic data) {
      add(FileContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'type': data['file_type'],
          'link': data['cloud_link'],
          'created_on': DateTime.parse(data['created_on'].toDate().toString()),
          'last_edit': DateTime.parse(data['last_edit'].toDate().toString()),
        },
        'cryptlink': data.id,
      }));
    });
  }
}
