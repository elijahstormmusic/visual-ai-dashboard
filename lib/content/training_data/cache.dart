
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';

import 'package:visual_ai/firestore/firestore.dart';


class TrainingDataCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  TrainingDataCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = MockContent.all;

      for (int i=0;i<list.length;i++) {
        add(TrainingDataContent(list[i]));
      }

      return;
    }

    FirestoreApi.download('training_data', {
      'limit': 25,
      'group': 'group0',
      'document': '4ctc1i9v3NUbebM1iNzNs10hDci1',
    }, (dynamic data) {
      add(TrainingDataContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'training_data': data['details']['data'],
          'encoding': data['details']['encoding'],
          'approved': data['approved'],
          'created': data['created'],
          'edited': data['edited'],
          'uses': data['uses'],
          'author': data['author'],

          'important': data['uses'] >= 100,
          'recent': true,
          'other': true,
        },
        'cryptlink': data.id,
      }));
    });
  }
}
