import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/content/dashboard/content.dart';


class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard(
    this.storageDetails, {
    Key? key,
  }) : super(key: key);

  final DashboardContent storageDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Theme.of(context).accentColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Theme(
              data: ThemeData(
                iconTheme: Theme.of(context).iconTheme.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: storageDetails.icon,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storageDetails.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                      '${storageDetails.data['num_of_files']} Files',
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(storageDetails.data['total_storage']),
        ],
      ),
    );
  }
}
