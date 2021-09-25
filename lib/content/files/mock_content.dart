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
      'type': CONTENT.FILE,
      'title': 'XD File',
      'caption': '3.5mb',
      'details': {
        'type': 0,
        'link': '/',
        'created_on': '01-03-2021',
        'last_edit': '01-03-2021',
      },
      'cryptlink': 'fileCryptlink0',
    },
    {
      'type': CONTENT.FILE,
      'title': 'Figma File',
      'caption': '19.0mb',
      'details': {
        'type': 1,
        'link': '/',
        'created_on': '27-02-2021',
        'last_edit': '27-02-2021',
      },
      'cryptlink': 'fileCryptlink1',
    },
    {
      'type': CONTENT.FILE,
      'title': 'Document',
      'caption': '32.5mb',
      'details': {
        'type': 2,
        'link': '/',
        'created_on': '23-02-2021',
        'last_edit': '23-02-2021',
      },
      'cryptlink': 'fileCryptlink2',
    },
    {
      'type': CONTENT.FILE,
      'title': 'Sound File',
      'caption': '3.5mb',
      'details': {
        'type': 3,
        'link': '/',
        'created_on': '21-02-2021',
        'last_edit': '21-02-2021',
      },
      'cryptlink': 'fileCryptlink3',
    },
    {
      'type': CONTENT.FILE,
      'title': 'Media File',
      'caption': '2.5gb',
      'details': {
        'type': 4,
        'link': '/',
        'created_on': '23-02-2021',
        'last_edit': '23-02-2021',
      },
      'cryptlink': 'fileCryptlink4',
    },
    {
      'type': CONTENT.FILE,
      'title': 'Sales PDF',
      'caption': '3.5mb',
      'details': {
        'type': 5,
        'link': '/',
        'created_on': '25-02-2021',
        'last_edit': '25-02-2021',
      },
      'cryptlink': 'fileCryptlink5',
    },
        {
      'type': CONTENT.FILE,
      'title': 'Excel File',
      'caption': '34.5mb',
      'details': {
        'type': 6,
        'link': '/',
        'created_on': '25-02-2021',
        'last_edit': '25-02-2021',
      },
      'cryptlink': 'fileCryptlink6',
    },
  ];
}
