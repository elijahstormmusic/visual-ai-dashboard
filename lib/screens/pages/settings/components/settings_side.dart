import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';


class DashSettingsSide extends StatelessWidget {
  const DashSettingsSide({
    Key? key,
  }) : super(key: key);

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
                'Account Info',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Responsive(
            mobile: EmptyContainerTesst(
              crossAxisCount: _size.width < 650 ? 2 : 2,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: EmptyContainerTesst(),
            desktop: EmptyContainerTesst(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyContainerTesst extends StatelessWidget {
  const EmptyContainerTesst({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
