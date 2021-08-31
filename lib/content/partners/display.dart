import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:visual_ai/theme.dart';

import 'partner.dart';


class PartnerDisplayPage extends StatefulWidget {
  final String cryptlink;

  PartnerDisplayPage(this.cryptlink);

  @override
  _PartnerDisplayPageState createState() => _PartnerDisplayPageState();
}

class _PartnerDisplayPageState extends State<PartnerDisplayPage> {

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
