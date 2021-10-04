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
      'type': CONTENT.PROFILE,
      'title': 'Documents',
      'caption': '',
      'details': {
        'type': 'overview',
        'fileSource': 'document',
        'numOfFiles': 1328,
        'totalStorage': '1.9GB',
        'percentage': 35,
      },
      'cryptlink': 'profileCryptlink0',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Google Drive',
      'caption': '',
      'details': {
        'type': 'overview',
        'fileSource': 'google',
        'numOfFiles': 1328,
        'totalStorage': '2.9GB',
        'percentage': 35,
      },
      'cryptlink': 'profileCryptlink1',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'One Drive',
      'caption': '',
      'details': {
        'type': 'overview',
        'fileSource': 'one drive',
        'numOfFiles': 1328,
        'totalStorage': '1GB',
        'percentage': 10,
      },
      'cryptlink': 'profileCryptlink2',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Documents',
      'caption': '',
      'details': {
        'type': 'overview',
        'fileSource': 'dropbox',
        'numOfFiles': 5328,
        'totalStorage': '7.3GB',
        'percentage': 78,
      },
      'cryptlink': 'profileCryptlink3',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Document Files',
      'caption': '',
      'details': {
        'type': 'storage',
        'mediaType': 'document',
        'size': '1.3GB',
        'numOfFiles': 1328,
      },
      'cryptlink': 'profileCryptlink4',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Media Files',
      'caption': '',
      'details': {
        'type': 'storage',
        'mediaType': 'media',
        'size': '1.3GB',
        'numOfFiles': 1328,
      },
      'cryptlink': 'profileCryptlink5',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Other Files',
      'caption': '',
      'details': {
        'type': 'storage',
        'mediaType': 'other',
        'size': '1.3GB',
        'numOfFiles': 1328,
      },
      'cryptlink': 'profileCryptlink6',
    },
    {
      'type': CONTENT.PROFILE,
      'title': 'Unknown',
      'caption': '',
      'details': {
        'type': 'storage',
        'mediaType': 'unknown',
        'size': '1.3GB',
        'numOfFiles': 140,
      },
      'cryptlink': 'profileCryptlink7',
    },
    {
      'type': CONTENT.PROFILE,
      'title': '29.1',
      'caption': 'of 128GB',
      'details': {
        'type': 'storage pie',
        'data': [
          {
            'value': 25,
            'radius': 25,
          },
          {
            'value': 20,
            'radius': 22,
          },
          {
            'value': 10,
            'radius': 19,
          },
          {
            'value': 15,
            'radius': 16,
          },
          {
            'value': 25,
            'radius': 13,
          },
        ],
      },
      'cryptlink': 'profileCryptlink8',
    },
  ];
}
