import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:visual_ai/theme.dart';

import '../content_profile.dart';


class UserContentDisplayPage extends StatefulWidget {
  final String cryptlink;

  UserContentDisplayPage(this.cryptlink);

  @override
  _UserContentDisplayPageState createState() => _UserContentDisplayPageState();
}

class _UserContentDisplayPageState extends State<UserContentDisplayPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

          ],
        ),
      ),
    );
  }
}
