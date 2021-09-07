import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/constants.dart';

import 'components/popular_items_display.dart';
import 'components/recent_items_display.dart';
import 'components/purchased_items_display.dart';


class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header('Store'),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      PopularItems(),
                      SizedBox(height: defaultPadding),
                      RecentItems(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) PurchasedStoreItems(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: PurchasedStoreItems(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
