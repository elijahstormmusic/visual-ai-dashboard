import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/content/training_data/cache.dart';
import 'package:visual_ai/screens/components/animations/loading.dart';

import 'small_training_data_block.dart';


class OtherTrainingData extends StatelessWidget {
  const OtherTrainingData({
    Key? key,
    this.force_width = 4,
  }) : super(key: key);

  final int force_width;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Other',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('View All'),
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Responsive(
            mobile: TrainingDataBlock(
              crossAxisCount: _size.width < 650 ? 1 : 1,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: TrainingDataBlock(
              crossAxisCount: force_width,
            ),
            desktop: TrainingDataBlock(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                crossAxisCount: force_width,
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingDataBlock extends StatelessWidget {
  const TrainingDataBlock({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingDataCache>(
      builder: (context, cache, child) {

        var filter = cache.filter('other', limit: 8);

        if (filter.length == 0) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Loading(),
            ),
          );
        }

        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: filter.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SmallTrainingDataBlock(
              filter[index],
            ),
          ),
        );
      },
    );
  }
}
