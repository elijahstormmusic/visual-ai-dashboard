import 'package:flutter/material.dart';

class RecentFriendActivity {
  final String? icon, title, date, type, status;
  final Color? color;

  RecentFriendActivity({this.icon, this.title, this.date, this.type, this.color, this.status});
}

List demoRecentFriendActivities = [
  RecentFriendActivity(
    icon: 'assets/icons/user.svg',
    title: 'New Account',
    date: '25-02-2021',
    type: 'account',
    status: 'read',
    color: Colors.yellow,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/email.svg',
    title: 'Message from Admin',
    date: '25-02-2021',
    type: 'message',
    status: 'read',
    color: Colors.purple,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/danger.svg',
    title: 'New Task from Admin',
    date: '23-02-2021',
    type: 'important',
    status: 'read',
    color: Colors.red,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/email.svg',
    title: 'Message from Phil - Imaging',
    date: '21-02-2021',
    type: 'message',
    status: 'unread',
    color: Colors.purple,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/checked.svg',
    title: 'Task Completed',
    date: '23-02-2021',
    type: 'success',
    status: 'unread',
    color: Colors.green,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/email.svg',
    title: 'Reply to your Comment - [The new cameras are great...]',
    date: '27-02-2021',
    type: 'message',
    status: 'unread',
    color: Colors.purple,
  ),
  RecentFriendActivity(
    icon: 'assets/icons/google-docs.svg',
    title: 'Activity Report Submitted',
    date: '01-03-2021',
    type: 'document',
    status: 'read',
    color: Colors.blue,
  ),
];
