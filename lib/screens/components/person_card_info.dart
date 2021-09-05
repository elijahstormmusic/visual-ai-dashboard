import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/content/content.dart';
import 'package:visual_ai/constants.dart';


class PersonCardInfo extends StatelessWidget {
  const PersonCardInfo({
    Key? key,
    required this.info,
  }) : super(key: key);

  final DashboardContent info;

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
