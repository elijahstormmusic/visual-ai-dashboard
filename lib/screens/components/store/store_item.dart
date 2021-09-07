import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/blinking_content.dart';

import 'package:visual_ai/content/content.dart';


class StoreItem extends StatelessWidget {
  final DashboardContent info;

  const StoreItem(
    this.info, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: info.icon,
            ),
            Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              child: Text(
                info.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
