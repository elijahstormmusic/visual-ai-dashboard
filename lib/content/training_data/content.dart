import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';

import 'display.dart';
import 'cache.dart';
import '../content.dart';


class TrainingDataContent extends DashboardContent {
  TrainingDataContent(Map<String, dynamic> input)
    : super(
      title: input['title'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  TrainingDataContentDisplayPage navigateTo() {
    return TrainingDataContentDisplayPage(cryptlink);
  }

  Widget get icon => Container(
    child: SvgPicture.network(
      Constants.training_data_svgs + cryptlink + '.svg',
      fit: BoxFit.fill,
    ),
  );
}
