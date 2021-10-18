import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:visual_ai/content/notifications/content.dart';
import 'package:visual_ai/content/notifications/cache.dart';
import 'package:visual_ai/constants.dart';


class RecentFriendActivities extends StatelessWidget {
  const RecentFriendActivities({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Consumer<NotificationCache>(
      builder: (context, cache, child) {
        return Container(
          height: 500,
          child: ListView.builder(
            itemCount: cache.items.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: notificationItem(cache.items[index]),
                secondaryActions: <Widget>[
                  Container(
                    height: 60,
                    color: Colors.grey.shade500,
                    child: Icon(Icons.info_outline, color: Colors.white,)
                  ),
                  Container(
                    height: 60,
                    color: Colors.red,
                    child: Icon(Icons.delete_outline_sharp, color: Colors.white,)
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget notificationItem(NotificationContent notification) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                notification.hasStory
                  ? Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orangeAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft
                      ),
                      // border: Border.all(color: Colors.red),
                      shape: BoxShape.circle
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(notification.profilePic)
                      ),
                    ),
                  )
                  : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 1)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(notification.profilePic)
                    ),
                  ),
                SizedBox(width: 10,),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: notification.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        TextSpan(text: notification.content, style: TextStyle(color: Colors.black)),
                        TextSpan(text: notification.timeAgo, style: TextStyle(color: Colors.grey.shade500),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          notification.postImage != ''
            ? Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  child: Image.network(notification.postImage)
                ),
              )
            : Container(
                height: 35,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('Follow', style: TextStyle(color: Colors.white))
                ),
              ),
        ],
      ),
    );
  }
}
