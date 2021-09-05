import 'package:flutter/material.dart';

import 'users/display.dart';
import 'users/cache.dart';

import 'content.dart';


class ContentProfile extends DashboardContent {
  ContentProfile(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      // pictures: input['pictures'],
      sex: input['sex'],
      online: input['online'],
      verified: input['verified'],
      cryptlink: input['cryptlink'],
    )
  { }

  static ContentProfile link(String input) {
    for (var i=0;i<UserCache.all.length;i++) {
      if (UserCache.all[i].cryptlink==input) {
        return UserCache.all[i];
      }
    }

    ContentProfile P = ContentProfile(UserCache.empty_shell(input));

    // socket.emit('partners link', {
    //   'link': input,
    // });

    UserCache.add(P);

    return P;
  }

  UserContentDisplayPage navigateTo() {
    return UserContentDisplayPage(cryptlink);
  }
}
