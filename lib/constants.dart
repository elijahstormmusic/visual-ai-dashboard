import 'package:flutter/material.dart';

const primaryColorDark = Color(0xFF2697FF);
const cardColorDark = Color(0xFF2A2D3E);
const bgColorDark = Color(0xFF212332);
const primaryColorLight = Color(0xFF2697FF);
const cardColorLight = Color(0xFFECF2F9);
const bgColorLight = Color(0xFFf8f9fa);

const defaultPadding = 16.0;

class Constants {
  static const String demo_source = 'assets/demo/';
  static const String media_source = 'assets/demo/';

  static const String live_svgs = 'https://avatars.dicebear.com/api/avataaars/';
  static const String store_items_svgs = 'https://avatars.dicebear.com/api/gridy/';
  static const String training_data_svgs = 'https://avatars.dicebear.com/api/jdenticon/';

  static const String loading_placeholder = 'assets/images/loading.jpg';

  static const String appName = 'V.AI';
  static const String appTitleDesc = 'Admin Panel';
  static const String logo_asset = 'assets/images/logo.png';
  static const String logoTag = 'vaidash.logo';
  static const String titleTag = 'vaidash.title';

  static String timeSinceDate(DateTime date) {
    Duration timeSince = DateTime.now().difference(date);
    String output = 'just now';

    if (timeSince.inSeconds < 0) return output;

    if (timeSince.inDays == 0) {
      if (timeSince.inHours == 0) {
        if (timeSince.inMinutes == 0) {
          output = timeSince.inSeconds.toString() + ' second';
          if (timeSince.inSeconds > 1) output += 's';
          output += ' ago';
        } else {
          output = timeSince.inMinutes.toString() + ' minute';
          if (timeSince.inMinutes > 1) output += 's';
          output += ' ago';
        }
      } else {
        output = timeSince.inHours.toString() + ' hour';
        if (timeSince.inHours > 1) output += 's';
        output += ' ago';
      }
    }
    else {
      if (timeSince.inDays >= 365) {
        int years = timeSince.inDays ~/ 365;
        output = years.toString() + ' year';
        if (years > 1) output += 's';
        output += ' ago';
      } else if (timeSince.inDays >= 29) {
        int months = timeSince.inDays ~/ 30;
        output = months.toString() + ' month';
        if (months > 1) output += 's';
        output += ' ago';
      } else {
        output = timeSince.inDays.toString() + ' day';
        if (timeSince.inDays > 1) output += 's';
        output += ' ago';
      }
    }

    return output;
  }
}
