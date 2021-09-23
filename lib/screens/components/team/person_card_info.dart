import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/content/users/content.dart';
import 'package:visual_ai/constants.dart';


class PersonCardInfo extends StatelessWidget {
  const PersonCardInfo(
    this.info, {
    Key? key,
  }) : super(key: key);

  final UserContent info;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                info.title,
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
