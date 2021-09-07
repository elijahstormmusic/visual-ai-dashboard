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
      'type': CONTENT.NOTIFICATION,
      'text': 'New Account',
      'caption': '',
      'details': {
        'date': '25-02-2021',
        'type': 'account',
        'status': 'read',
      },
      'cryptlink': 'jennie',
    },
    {
      'type': CONTENT.NOTIFICATION,
      'text': 'Message from Admin',
      'caption': '',
      'details': {
        'date': '25-02-2021',
        'type': 'message',
        'status': 'read',
      },
      'cryptlink': 'linkMessage',
    },
    {
      'type': CONTENT.NOTIFICATION,
      'text': 'New Task from Admin',
      'caption': 'Init Training Model',
      'details': {
        'date': '23-02-2021',
        'type': 'important',
        'status': 'read',
      },
      'cryptlink': 'linkNew',
    },
    {
      'type': CONTENT.NOTIFICATION,
      'text': 'Message from Phil',
      'caption': 'Imaging',
      'details': {
        'date': '21-02-2021',
        'type': 'message',
        'status': 'unread',
      },
      'cryptlink': 'linkMessage',
    },
    {
      'type': CONTENT.NOTIFICATION,
      'text': 'Task Completed',
      'caption': 'Init Training Model',
      'details': {
        'date': '23-02-2021',
        'type': 'success',
        'status': 'unread',
      },
      'cryptlink': 'linkTask',
    },
    {
      'type': CONTENT.NOTIFICATION,
      'text': 'Reply to your Comment',
      'caption': '[The new cameras are great...]',
      'details': {
        'date': '27-02-2021',
        'type': 'message',
        'status': 'unread',
      },
      'cryptlink': 'linkReply',
    },
      {
      'type': CONTENT.NOTIFICATION,
      'text': 'Activity Report Submitted',
      'caption': '',
      'details': {
        'date': '01-03-2021',
        'type': 'document',
        'status': 'read',
      },
      'cryptlink': 'linkActivity',
    },
  ];
}
