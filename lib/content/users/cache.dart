
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
        add(UserContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('users', {
      'limit': 10,
      // 'group': null,
      // 'document': null,
    }, (dynamic data) {
      add(UserContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'image': data['image'],
          'sex': data['sex'],
          'online': data['online'],
          'verified': data['verified'],
          'team_member': true,
          'friend': true,
          'created_on': DateTime.parse(data['created_on'].toDate().toString()),
          'last_login': DateTime.parse(data['last_login'].toDate().toString()),
        },
        'cryptlink': data.id,
      }));
    });
  }
}
