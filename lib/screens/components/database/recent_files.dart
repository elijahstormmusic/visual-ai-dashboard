import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:visual_ai/constants.dart';
import 'package:visual_ai/content/files/content.dart';
import 'package:visual_ai/content/files/cache.dart';


class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Recent Files',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: Consumer<FileCache>(
              builder: (context, cache, child) => DataTable2(
                columnSpacing: defaultPadding,
                minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text('File Name'),
                  ),
                  DataColumn(
                    label: Text('Last Edit'),
                  ),
                  DataColumn(
                    label: Text('Size'),
                  ),
                ],
                rows: List.generate(
                  cache.items.length,
                  (index) => recentFileDataRow(
                    (cache.items[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(FileContent fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: fileInfo.icon,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title),
            ),
          ],
        ),
      ),
      DataCell(
        Text(
          Constants.timeSinceDate(fileInfo.edited_on),
        ),
      ),
      DataCell(Text(fileInfo.caption)),
    ],
  );
}
