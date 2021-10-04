import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'content.dart';


class AdvertisementContentDisplayPage extends StatefulWidget {
  final String cryptlink;

  AdvertisementContentDisplayPage(this.cryptlink);

  _UserContentDisplayPageState createState() => _UserContentDisplayPageState();
}

class _UserContentDisplayPageState extends State<AdvertisementContentDisplayPage> {

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
