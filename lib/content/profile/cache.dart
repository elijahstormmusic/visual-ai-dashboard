
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class ProfileCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  ProfileCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(ProfileContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('profile', {
      'limit': 10,
      'group': null,
      'userId': '4ctc1i9v3NUbebM1iNzNs10hDci1',
    }, (dynamic data) {
      add(ProfileContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
        },
        'cryptlink': data.id,
      }));
    });
  }

  List<ProfileContent> filter(String type, {
    int limit = 10,
  }) {
    List<ProfileContent> content = [];
    var list = items;

    for (int i = 0; i < list.length && content.length < limit; i++) {
      if (list[i].details['type'] == type) {
        content.add(ProfileContent.cast(list[i]));
      }
    }

    return content;
  }

  ProfileContent at(String type) {
    var list = items;

    for (int i = 0; i < list.length; i++) {
      if (list[i].details['type'] == type) {
        return ProfileContent.cast(list[i]);
      }
    }

    return ProfileContent(MockContent.all[0]);
  }
}
