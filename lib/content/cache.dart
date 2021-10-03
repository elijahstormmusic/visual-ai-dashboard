import 'package:flutter/foundation.dart';

import 'content.dart';


class ContentCache extends ChangeNotifier {
  static bool Load_Mock_Data = false;

  List<DashboardContent> _items = [];

  List<DashboardContent> get items => List.unmodifiable(_items);

  void add(DashboardContent partner) {
    for (int i=0;i<_items.length;i++) {
      if (_items[i].id==partner.id) return;
    }

    _items.add(partner);

    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    notifyListeners();
  }
}
