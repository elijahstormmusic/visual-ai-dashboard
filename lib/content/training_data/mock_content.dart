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
        'training_data': 'tables1saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': true,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'tables1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups1saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'training_data': 'laptops1saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'laptops1',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups2saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'training_data': 'tables2saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'tables2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups2saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups2',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'training_data': 'laptops3saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'laptops3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups3saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': true,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'training_data': 'tables3saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': false,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'tables3',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups4saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'training_data': 'laptops4saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'laptops4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups4saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups4',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
      'caption': 'training the model to learn different types of tables',
      'details': {
        'training_data': 'tables5saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'tables5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups5saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': false,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'laptops',
      'caption': 'training the model to learn different types of laptops',
      'details': {
        'training_data': 'laptops5saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': true,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'laptops5',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups6saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups6',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'Tables',
        'caption': 'training the model to learn different types of tables',
      'details': {
        'training_data': 'tables6saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': false,
        'recent': false,
        'other': true,
        'date': '9-8-2021',
      },
      'cryptlink': 'tables6',
    },
    {
      'type': CONTENT.TRAINING_DATA,
      'text': 'cups',
      'caption': 'training the model to learn different types of cups',
      'details': {
        'training_data': 'cups6saghjaehA',
        'encoding_type': 'encryptedStrToImgHash',
        'important': true,
        'recent': false,
        'other': false,
        'date': '9-8-2021',
      },
      'cryptlink': 'cups6',
    },
  ];
}
