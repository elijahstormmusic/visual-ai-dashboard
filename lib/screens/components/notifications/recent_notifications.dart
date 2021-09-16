import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:visual_ai/content/content.dart';
import 'package:visual_ai/content/notifications/cache.dart';
import 'package:visual_ai/constants.dart';


class RecentNotifications extends StatelessWidget {
  const RecentNotifications({
    Key? key,
  }) : super(key: key);

  DataRow recentNotoDataRow(DashboardContent notoInfo) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue.withOpacity(0.1);
      }
      return Colors.red.withOpacity(0.1);
    }

    return DataRow(
      color: notoInfo.details['status'] == 'unread' ? MaterialStateProperty.resolveWith(getColor) : null,
      cells: [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 30,
                  width: 30,
                  child: notoInfo.icon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  notoInfo.title + (
                    notoInfo.caption == '' ? '' : ' - ${notoInfo.caption}'
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text(notoInfo.details['date'])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Notifications',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Consumer<NotificationCache>(
            builder: (context, cache, child) {
              return SizedBox(
                width: double.infinity,
                child: DataTable2(
                  columnSpacing: defaultPadding,
                  minWidth: 600,
                  columns: [
                    DataColumn(
                      label: Text('Title'),
                    ),
                    DataColumn(
                      label: Text(''),
                    ),
                    DataColumn(
                      label: Text(''),
                    ),
                    DataColumn(
                      label: Text('Date'),
                    ),
                  ],
                  rows: List.generate(
                    cache.items.length,
                    (index) => recentNotoDataRow(cache.items[index]),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
