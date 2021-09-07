import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'file_info_card.dart';
import 'blinking_content.dart';

import 'package:visual_ai/content/content.dart';


class StoreItem extends StatelessWidget {
  final DashboardContent item;

  const StoreItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(item.text),
    );
  }
}
