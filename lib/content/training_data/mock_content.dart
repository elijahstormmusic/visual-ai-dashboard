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
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'important': false,
        'recent': true,
        'other': true,
      },
      'cryptlink': 'tables1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': true,
        'other': false,
      },
      'cryptlink': 'cups1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'important': false,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'laptops1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': true,
        'other': false,
      },
      'cryptlink': 'cups2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'important': true,
        'recent': true,
        'other': true,
      },
      'cryptlink': 'tables2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': false,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'cups2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'important': true,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'laptops3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': false,
        'recent': true,
        'other': true,
      },
      'cryptlink': 'cups3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'important': true,
        'recent': false,
        'other': false,
      },
      'cryptlink': 'tables3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': true,
        'other': false,
      },
      'cryptlink': 'cups4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'important': true,
        'recent': true,
        'other': true,
      },
      'cryptlink': 'laptops4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': true,
        'other': false,
      },
      'cryptlink': 'cups4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'important': false,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'tables5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': false,
        'other': false,
      },
      'cryptlink': 'cups5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'important': true,
        'recent': true,
        'other': false,
      },
      'cryptlink': 'laptops5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': false,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'cups6',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'important': false,
        'recent': false,
        'other': true,
      },
      'cryptlink': 'tables6',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'important': true,
        'recent': false,
        'other': false,
      },
      'cryptlink': 'cups6',
    },
  ];
}
