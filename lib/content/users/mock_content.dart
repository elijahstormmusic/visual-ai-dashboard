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
      'text': 'Jennie',
      'caption': 'Just a girl from the New Zealand who moved to Korea to follow my passion',
      'details': {
        'sex': 'female',
        'online': true,
        'verified': true,
      },
      'cryptlink': 'jennie',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'donghee',
      'caption': 'I\'m an actor, but I will never be fake with you ;)',
      'details': {
        'sex': 'male',
        'online': false,
        'verified': true,
      },
      'cryptlink': 'donghee',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Lee Ji-eun',
      'caption': 'Some people call me IU, but you can call me love',
      'details': {
        'sex': 'female',
        'online': true,
        'verified': true,
      },
      'cryptlink': 'iu',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Jack Black',
      'caption': 'We came to ROCK!',
      'details': {
        'sex': 'male',
        'online': true,
        'verified': true,
      },
      'cryptlink': 'jackblack',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Snoop Doggy Dog',
      'caption': 'if you dont bring some smoke to the golf course... dont worry ill bring it',
      'details': {
        'sex': 'male',
        'online': false,
        'verified': true,
      },
      'cryptlink': 'snoop',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Tiger Woods',
      'caption': 'I know you know who I am',
      'details': {
        'sex': 'male',
        'online': true,
        'verified': false,
      },
      'cryptlink': 'tigerwoods',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Dorothy Oz',
      'caption': 'I don\'t think I\'m in Kansas anymore...',
      'details': {
        'sex': 'female',
        'online': false,
        'verified': false,
      },
      'cryptlink': 'dorothy',
    },
  ];
}
