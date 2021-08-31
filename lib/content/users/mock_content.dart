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
      'pictures': [
        'people/jennie/1.jpg',
        'people/jennie/2.jpg',
        'people/jennie/3.png',
        'people/jennie/4.jpg',
      ],
      'sex': 'female',
      'online': true,
      'verified': true,
      'cryptlink': 'jennie',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'donghee',
      'caption': 'I\'m an actor, but I will never be fake with you ;)',
      'pictures': [
        'people/donghee/1.jpg',
        'people/donghee/2.jpg',
        'people/donghee/3.jpg',
      ],
      'sex': 'male',
      'online': false,
      'verified': true,
      'cryptlink': 'donghee',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Lee Ji-eun',
      'caption': 'Some people call me IU, but you can call me love',
      'pictures': [
        'people/iu/1.jpg',
        'people/iu/2.jpg',
        'people/iu/3.jpg',
        'people/iu/4.jpg',
        'people/iu/5.jpg',
      ],
      'sex': 'female',
      'online': true,
      'verified': true,
      'cryptlink': 'iu',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Jack Black',
      'caption': 'We came to ROCK!',
      'pictures': [
        'people/jackblack/1.png',
        'people/jackblack/2.jpg',
        'people/jackblack/3.jpg',
        'people/jackblack/4.jpg',
      ],
      'sex': 'male',
      'online': true,
      'verified': true,
      'cryptlink': 'jackblack',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Snoop Doggy Dog',
      'caption': 'if you dont bring some smoke to the golf course... dont worry ill bring it',
      'pictures': [
        'people/snoop/1.png',
        'people/snoop/2.jpg',
        'people/snoop/3.jpg',
      ],
      'sex': 'male',
      'online': false,
      'verified': true,
      'cryptlink': 'snoop',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Tiger Woods',
      'caption': 'I know you know who I am',
      'pictures': [
        'people/tigerwoods/1.jpg',
        'people/tigerwoods/2.jpg',
        'people/tigerwoods/3.jpg',
      ],
      'sex': 'male',
      'online': true,
      'verified': false,
      'cryptlink': 'tigerwoods',
    },
    {
      'type': CONTENT.PROFILE,
      'text': 'Dorothy Oz',
      'caption': 'I don\'t think I\'m in Kansas anymore...',
      'pictures': [
        'people/dorothy/1.jpeg',
        'people/dorothy/2.jpg',
        'people/dorothy/3.jpg',
      ],
      'sex': 'female',
      'online': false,
      'verified': false,
      'cryptlink': 'dorothy',
    },
  ];
}
