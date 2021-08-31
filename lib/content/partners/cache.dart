
import 'partner.dart';
import 'mock_data.dart';


class PartnerCache {
  static List<Partner> all = [];

  static void add(Partner partner) {
    for (int i=0;i<all.length;i++) {
      if (all[i].cryptlink==partner.cryptlink) return;
    }

    all.add(partner);
  }

  static void load_mock_data() {
    var list = MockPartnerData.partners;

    for (int i=0;i<list.length;i++) {
      all.add(list[i]);
    }
  }
}
