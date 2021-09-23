import 'package:flutter/material.dart';

import 'package:visual_ai/content/training_data/content.dart';
import 'package:visual_ai/constants.dart';


class SmallTrainingDataBlock extends StatelessWidget {
  const SmallTrainingDataBlock(
    this.info, {
    Key? key,
  }) : super(key: key);

  final TrainingDataContent info;

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
