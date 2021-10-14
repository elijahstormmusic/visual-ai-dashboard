import 'package:flutter/material.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/animations/blinking_content.dart';

import 'package:visual_ai/screens/components/animations/loading.dart';


class TrainingModule extends StatelessWidget {
  const TrainingModule({
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
              BlinkingContent(
                child: Text(
                  'Loading Training API...',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
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
                label: Text('Add New'),
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: 500.0,
            child: Loading(),
          ),
        ],
      ),
    );
  }
}
