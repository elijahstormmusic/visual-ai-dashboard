import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/content/users/cache.dart';
import 'package:visual_ai/constants.dart';

import 'person_card_info.dart';


class DashboardProfileDisplay extends StatelessWidget {
  const DashboardProfileDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(defaultPadding),
          child: Text('balla'),
        ),
      ],
    );
  }
}
