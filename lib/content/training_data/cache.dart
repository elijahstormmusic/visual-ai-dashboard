
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
      'document': FirestoreApi.logged_in_user_id,
    }, (dynamic data) {
      add(TrainingDataContent({
        'title': data['title'],
        'caption': data['caption'],
        'details': {
          'training_data': data['details']['data'],
          'encoding': data['details']['encoding'],
          'approved': data['approved'],
          'created': DateTime.parse(data['created'].toDate().toString()),
          'edited': DateTime.parse(data['edited'].toDate().toString()),
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

  List<TrainingDataContent> filter(String type, {
    int limit = 10,
  }) {
    List<TrainingDataContent> content = [];
    var list = items;

    for (int i = 0; i < list.length && content.length < limit; i++) {
      if (list[i].details['type'].contains(type)) {
        content.add(TrainingDataContent.cast(list[i]));
      }
    }

    return content;
  }

  TrainingDataContent at(String type) {
    var list = items;

    for (int i = 0; i < list.length; i++) {
      if (list[i].details['type'].contains(type)) {
        return TrainingDataContent.cast(list[i]);
      }
    }

    return TrainingDataContent(MockContent.all[0]);
  }
}
