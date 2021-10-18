import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


// TODO: remove this
import 'dart:math';
Map<String, dynamic> RandomNotoModel = {
    "notifications": [
        {
            "name": "nesuixd",
            "profilePic": "https://uifaces.co/our-content/donated/3799Ffxy.jpeg",
            "content": " liked your video. ",
            "postImage": "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241314953_1514997702184050_3983656462351007940_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=sv5LCXQzXGkAX9iMz_x&edm=AL4D0a4BAAAA&ccb=7-4&oh=1ef9dc54dbf44deb7956ffb98d6300e5&oe=61403D5F&_nc_sid=712cc3",
            "timeAgo": "20s",
            "hasStory" : false
        },
        {
            "name":  "m.t.arrofi",
            "profilePic":  "https://randomuser.me/api/portraits/men/46.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "1m",
            "hasStory" :  false
        },
        {
            "name":  "digitalenvision",
            "profilePic":  "https://randomuser.me/api/portraits/men/86.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "1m",
            "hasStory" :   true
        },
        {
            "name":  "leah.stevens",
            "profilePic":  "https://randomuser.me/api/portraits/women/47.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "1m",
            "hasStory" :   true
        },
        {
            "name":  "thiago_barr1",
            "profilePic":  "https://uifaces.co/our-content/donated/ukegoVAy.jpg",
            "content":  " liked your video. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241314953_1514997702184050_3983656462351007940_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=sv5LCXQzXGkAX9iMz_x&edm=AL4D0a4BAAAA&ccb=7-4&oh=1ef9dc54dbf44deb7956ffb98d6300e5&oe=61403D5F&_nc_sid=712cc3",
            "timeAgo":  "2m",
            "hasStory" :  false
        },
        {
            "name":  "devon",
            "profilePic":  "https://uifaces.co/our-content/donated/6h0HeYG_.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "3m",
            "hasStory" :   true
        },
        {
            "name":  "jesse",
            "profilePic":  "https://uifaces.co/our-content/donated/KtCFjlD4.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "3m",
            "hasStory" :  false
        },
        {
            "name":  "rodrigo.hawkins",
            "profilePic":  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=74daec1914d1d105202bca8a310a6a71",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "3m",
            "hasStory" :  false
        },
        {
            "name":  "lucy.walker",
            "profilePic":  "https://randomuser.me/api/portraits/women/0.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :   true
        },
        {
            "name":  "arnob.mukherjee",
            "profilePic":  "https://uifaces.co/our-content/donated/1H_7AxP0.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :  false
        },
        {
            "name":  "lourdes",
            "profilePic":  "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=047fade70e80ebb22ac8f09c04872c40",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :  false
        },
        {
            "name":  "nesuixd",
            "profilePic":  "https://uifaces.co/our-content/donated/3799Ffxy.jpeg",
            "content":  " liked your video. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241314953_1514997702184050_3983656462351007940_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=sv5LCXQzXGkAX9iMz_x&edm=AL4D0a4BAAAA&ccb=7-4&oh=1ef9dc54dbf44deb7956ffb98d6300e5&oe=61403D5F&_nc_sid=712cc3",
            "timeAgo":  "20s",
            "hasStory" :  false
        },
        {
            "name":  "m.t.arrofi",
            "profilePic":  "https://randomuser.me/api/portraits/men/46.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "1m",
            "hasStory" :  false
        },
        {
            "name":  "digitalenvision",
            "profilePic":  "https://randomuser.me/api/portraits/men/86.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "1m",
            "hasStory" :   true
        },
        {
            "name":  "leah.stevens",
            "profilePic":  "https://randomuser.me/api/portraits/women/47.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "1m",
            "hasStory" :   true
        },
        {
            "name":  "thiago_barr1",
            "profilePic":  "https://uifaces.co/our-content/donated/ukegoVAy.jpg",
            "content":  " liked your video. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241314953_1514997702184050_3983656462351007940_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=sv5LCXQzXGkAX9iMz_x&edm=AL4D0a4BAAAA&ccb=7-4&oh=1ef9dc54dbf44deb7956ffb98d6300e5&oe=61403D5F&_nc_sid=712cc3",
            "timeAgo":  "2m",
            "hasStory" :  false
        },
        {
            "name":  "devon",
            "profilePic":  "https://uifaces.co/our-content/donated/6h0HeYG_.jpg",
            "content":  " liked your post. ",
            "postImage":  "https://instagram.fkbl4-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/241480993_564787968302949_6195733300593016483_n.jpg?_nc_ht=instagram.fkbl4-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=4ZjT9hUKHLUAX-TaULu&edm=AL4D0a4BAAAA&ccb=7-4&oh=3df371c91bd18db0d9172c42a797f265&oe=613FB38B&_nc_sid=712cc3",
            "timeAgo":  "3m",
            "hasStory" :   true
        },
        {
            "name":  "jesse",
            "profilePic":  "https://uifaces.co/our-content/donated/KtCFjlD4.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "3m",
            "hasStory" :  false
        },
        {
            "name":  "rodrigo.hawkins",
            "profilePic":  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=74daec1914d1d105202bca8a310a6a71",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "3m",
            "hasStory" :  false
        },
        {
            "name":  "lucy.walker",
            "profilePic":  "https://randomuser.me/api/portraits/women/0.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :   true
        },
        {
            "name":  "arnob.mukherjee",
            "profilePic":  "https://uifaces.co/our-content/donated/1H_7AxP0.jpg",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :  false
        },
        {
            "name":  "lourdes",
            "profilePic":  "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=047fade70e80ebb22ac8f09c04872c40",
            "content":  " started following you. ",
            "postImage":  "",
            "timeAgo":  "4m",
            "hasStory" :  false
        }
    ]
};


class NotificationContent extends ContentContainer {
  static const String CollectionName = 'notos';
  String get collection => CollectionName;
  final content_type = CONTENT.NOTIFICATION;

  final DateTime date;
  final String type, status;

  final String name;
  final String profilePic;
  final String content;
  final String postImage;
  final String timeAgo;
  final bool hasStory;

  NotificationContent({
    required this.date,
    required this.type,
    required this.status,

    required this.name,
    required this.profilePic,
    required this.content,
    required this.postImage,
    required this.timeAgo,
    required this.hasStory,

    required title,
    required caption,
    required id,
  })
    : super(
      title: title,
      caption: caption,
      id: id,
    )
  { }

  factory NotificationContent.fromJson(dynamic data) => NotificationContent(
    title: data['title'],
    caption: data['caption'],
    date: data['date'].toDate(),
    type: data['type'],
    status: data['status'],

    name: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['name'],
    profilePic: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['profilePic'],
    content: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['content'],
    postImage: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['postImage'],
    timeAgo: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['timeAgo'],
    hasStory: RandomNotoModel['notifications'][
      Random().nextInt(RandomNotoModel['notifications'].length)
    ]['hasStory'],

    id: data['id'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'caption': caption,
    'date': Timestamp.fromDate(date),
    'type': type,
    'status': status,

    // 'name': name,
    // 'profilePic': profilePic,
    // 'content': content,
    // 'postImage': postImage,
    // 'timeAgo': timeAgo,
    // 'hasStory': hasStory,
  };

  NotificationContentDisplayPage navigateTo() {
    return NotificationContentDisplayPage(this);
  }

  Widget get icon {
    Color color = Colors.blue;
    String asset = 'assets/icons/google-docs.svg';

    switch (type) {
      case 'account':
        asset = 'assets/icons/user.svg';
        color = Colors.yellow;
        break;
      case 'message':
        asset = 'assets/icons/email.svg';
        color = Colors.purple;
        break;
      case 'important':
        asset = 'assets/icons/danger.svg';
        color = Colors.red;
        break;
      case 'success':
        asset = 'assets/icons/checked.svg';
        color = Colors.green;
        break;
      case 'document':
        asset = 'assets/icons/google-docs.svg';
        color = Colors.blue;
        break;
      default:
        asset = 'assets/icons/google-docs.svg';
        color = Colors.blue;
        break;
    }

    return Container(
      color: color.withOpacity(0.3),
      padding: EdgeInsets.all(6),
      child: SvgPicture.asset(
        asset,
        color: color.withOpacity(0.7),
      ),
    );
  }
}
