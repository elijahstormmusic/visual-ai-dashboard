import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:visual_ai/models/RecentFriendActivity.dart';
import 'package:visual_ai/constants.dart';

class RecentFriendActivities extends StatelessWidget {
  const RecentFriendActivities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Notifications',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
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
                demoRecentFriendActivities.length,
                (index) => recentNotoDataRow(demoRecentFriendActivities[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentNotoDataRow(RecentFriendActivity friendInfo) {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue.withOpacity(0.2);
    }
    return Colors.red.withOpacity(0.2);
  }

  return DataRow(
    color: friendInfo.status! == 'unread' ? MaterialStateProperty.resolveWith(getColor) : null,
    cells: [
      DataCell(
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: friendInfo.color!.withOpacity(0.3),
              child: SvgPicture.asset(
                friendInfo.icon!,
                color: friendInfo.color!.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                friendInfo.title!,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text(friendInfo.date!)),
    ],
  );
}
