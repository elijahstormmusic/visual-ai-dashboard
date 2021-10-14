import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/content/training_data/cache.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/screens/components/training_data/training_module.dart';
import 'package:visual_ai/screens/components/training_data/recent.dart';
import 'package:visual_ai/constants.dart';


class TrainingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TrainingDataCache()),
        ],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header('Training'),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        TrainingModule(),
                        SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) RecentTrainingData(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: RecentTrainingData(
                        force_width: 1,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
