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
      'type': CONTENT.AD,
      'text': 'Jennie',
      'caption': 'Just a girl from the New Zealand who moved to Korea to follow my passion',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'jennie',
    },
    {
      'type': CONTENT.AD,
      'text': 'donghee',
      'caption': 'I\'m an actor, but I will never be fake with you ;)',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'donghee',
    },
    {
      'type': CONTENT.AD,
      'text': 'Lee Ji-eun',
      'caption': 'Some people call me IU, but you can call me love',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'iu',
    },
    {
      'type': CONTENT.AD,
      'text': 'Jack Black',
      'caption': 'We came to ROCK!',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'jackblack',
    },
      {
      'type': CONTENT.AD,
      'text': 'Snoop Doggy Dog',
      'caption': 'if you dont bring some smoke to the golf course... dont worry ill bring it',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'snoop',
    },
    {
      'type': CONTENT.AD,
      'text': 'Tiger Woods',
      'caption': 'I know you know who I am',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'tigerwoods',
    },
    {
      'type': CONTENT.AD,
      'text': 'Dorothy Oz',
      'caption': 'I don\'t think I\'m in Kansas anymore...',
      'details': {
        'nothing': true,
      },
      'cryptlink': 'dorothy',
    },
  ];
}
