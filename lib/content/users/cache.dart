
import '../content_profile.dart';
import 'mock_content.dart';


class UserCache {
  static List<ContentProfile> all = [];

  static void add(ContentProfile partner) {
    for (int i=0;i<all.length;i++) {
      if (all[i].cryptlink==partner.cryptlink) return;
    }

    all.add(partner);
  }

  static Map<String, dynamic> empty_shell(String cryptlink) {
    var data = MockContent.all[0];

    data['cryptlink'] = cryptlink;

    return data;
  }

  static void load_mock_data() {
    var list = MockContent.all;

    for (int i=0;i<list.length;i++) {
      all.add(ContentProfile(list[i]));
    }
  }
}
