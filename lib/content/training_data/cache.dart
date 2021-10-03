
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
        add(TrainingDataContent.fromJson(list[i]));
      }

      return;
    }

    FirestoreApi.download(
      TrainingDataContent.Collection_Name,
      limit: 25,
      team_id: FirestoreApi.active_team,
      user_id: FirestoreApi.active_user,
      populate: (dynamic data) => add(
        TrainingDataContent.fromJson(data),
      ),
    );
  }

  List<TrainingDataContent> filter(String type, {
    int limit = 10,
  }) {
    List<TrainingDataContent> content = [];
    var list = items;

    for (int i = 0; i < list.length && content.length < limit; i++) {
      if (list[i].encoding_type.contains(type)) {
        content.add(TrainingDataContent.cast(list[i]));
      }
    }

    return content;
  }

  TrainingDataContent at(String type) {
    var list = items;

    for (int i = 0; i < list.length; i++) {
      if (list[i].encoding_type.contains(type)) {
        return TrainingDataContent.cast(list[i]);
      }
    }

    return TrainingDataContent(MockContent.all[0]);
  }
}
