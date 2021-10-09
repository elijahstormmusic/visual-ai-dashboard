import 'package:flutter/foundation.dart';

import 'content.dart';


class ContentCache<T extends ContentContainer> extends ChangeNotifier {
  static bool Load_Mock_Data = false;
  List<Map<String, dynamic>> get mockData => [{
    'title': '',
    'caption': '',
    'id': '',
  }];


  List<T> _items = [];
  List<T> get items => List.unmodifiable(_items);
  void download() {}
  T? fromJson(dynamic data) => null;

  ContentCache() {
    if (ContentCache.Load_Mock_Data) {
      var list = mockData;

      for (int i=0;i<list.length;i++) {
        add(fromJson(list[i])!);
      }

      return;
    }

    download();
  }

  void add(T partner) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].id==partner.id) return;
    }

    _items.add(partner);

    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    notifyListeners();
  }


  List<T> filter(String query, {
    int limit = 10,
  }) {
    List<T> content = [];
    var list = items;

    for (int i = 0; i < list.length && content.length < limit; i++) {
      if (list[i].find(query)) {
        content.add(list[i]);
      }
    }

    return content;
  }
  T at(String query) {
    var list = items;

    for (int i = 0; i < list.length; i++) {
      if (list[i].find(query)) {
        return list[i];
      }
    }

    return fromJson(mockData[0])!;
  }

  List<T> getMockData() {
    List<T> mocks = [];

    var list = mockData;

    for (int i=0;i<list.length;i++) {
      mocks.add(fromJson(list[i])!);
    }

    return mocks;
  }
}
