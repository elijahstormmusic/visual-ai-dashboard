import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/store/store_item.dart';

import 'package:visual_ai/content/store/cache.dart';


class PopularItems extends StatelessWidget {
  const PopularItems({
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
                'Popular Store Items',
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
                label: Text('More'),
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Responsive(
            mobile: NoContentFunSquare(
              crossAxisCount: _size.width < 650 ? 2 : 2,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: NoContentFunSquare(),
            desktop: NoContentFunSquare(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class NoContentFunSquare extends StatelessWidget {
  const NoContentFunSquare({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreCache>(
      builder: (context, cache, child) {

        List filter = [];
        var items = cache.items;

        for (int i=0;i<items.length;i++) {
          if (items[i].popular) {
            filter.add(items[i]);
          }
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
          itemCount: min(9, filter.length),
          itemBuilder: (context, index) => StoreItem(
              filter[index],
          ),
        );
      },
    );
  }
}
