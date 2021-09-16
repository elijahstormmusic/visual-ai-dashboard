import '../content.dart';


class MockContent {

  static List<Map<String, dynamic> > get all {
    List<Map<String, dynamic> > list = [];

    for (int i=0;i<data.length;i++) {
      list.add(data[i]);
    }

    return list;
  }

  static List<Map<String, dynamic> > data = [
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item1',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem1',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular1',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular1',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed1',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed1',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item2',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem2',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular2',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular2',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed2',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed2',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item3',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem3',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular3',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular3',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed3',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed3',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item4',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem4',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular4',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular4',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed4',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed4',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item5',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem5',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular5',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular5',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed5',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed5',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item6',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem6',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular6',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular6',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed6',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed6',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'New Item7',
      'caption': 'Buy this new thing',
      'details': {
        'popular': false,
        'recent': true,
        'purchased': false,
      },
      'cryptlink': 'newitem7',
      },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'popular7',
      'caption': 'Popular stuff',
      'details': {
        'popular': true,
        'recent': false,
        'purchased': false,
      },
      'cryptlink': 'popular7',
    },
    {
      'type': CONTENT.STORE_ITEM,
      'title': 'purcahsed7',
      'caption': 'You already bought this',
      'details': {
        'popular': false,
        'recent': false,
        'purchased': true,
      },
      'cryptlink': 'purcahsed7',
    },
  ];
}
