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

    Widget buildNotoIcon(String type) {
      Color color = Colors.blue;
      String asset = 'assets/icons/google-docs.svg';

      switch (type) {
        case 'account':
        asset = 'assets/icons/user.svg';
        color = Colors.yellow;
        break;
        case 'message':
        asset = 'assets/icons/email.svg';
        color = Colors.purple;
        break;
        case 'important':
        asset = 'assets/icons/danger.svg';
        color = Colors.red;
        break;
        case 'success':
        asset = 'assets/icons/checked.svg';
        color = Colors.green;
        break;
        case 'document':
        asset = 'assets/icons/google-docs.svg';
        color = Colors.blue;
        break;
        default:
        asset = 'assets/icons/google-docs.svg';
        color = Colors.blue;
        break;
      }

      return Container(
        height: 30,
        width: 30,
        color: color.withOpacity(0.3),
        padding: EdgeInsets.all(6),
        child: SvgPicture.asset(
          asset,
          color: color.withOpacity(0.7),
        ),
      );
    }

    return DataRow(
      color: notoInfo.details['status'] == 'unread' ? MaterialStateProperty.resolveWith(getColor) : null,
      cells: [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: buildNotoIcon(notoInfo.details['type']),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  notoInfo.text + (
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
        color: secondaryColor,
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
