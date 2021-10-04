import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/charts/charts.dart';
import 'package:visual_ai/content/dashboard/cache.dart';
import 'storage_info_card.dart';


class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardCache>(
      builder: (context, cache, child) {

        var storage = cache.filter('storage', limit: 4);

        return Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Storage Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: defaultPadding),

              StorageChart(cache.at('storage pie')),

              Column(
                children: List.generate(
                  storage.length,
                  (i) => StorageInfoCard(storage[i]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
