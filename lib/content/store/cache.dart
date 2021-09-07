
import '../cache.dart';
import 'content.dart';
import 'mock_content.dart';


class StoreCache extends ContentCache {
  Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  StoreCache() {
    if (!ContentCache.Load_Mock_Data) return;

    var list = MockContent.all;

    for (int i=0;i<list.length;i++) {
      add(StoreContent(list[i]));
    }
  }
}
