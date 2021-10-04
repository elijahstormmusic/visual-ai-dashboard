import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/content/users/cache.dart';
import 'package:visual_ai/constants.dart';

import 'person_card_info.dart';


class OurTeamMembers extends StatelessWidget {
  const OurTeamMembers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Our Team',
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
              label: Text('View All'),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: TeamMemberCardInfoGridView(
            crossAxisCount: _size.width < 650 ? 2 : 2,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: TeamMemberCardInfoGridView(),
          desktop: TeamMemberCardInfoGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TeamMemberCardInfoGridView extends StatelessWidget {
  const TeamMemberCardInfoGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCache>(
      builder: (context, cache, child) {

        List filter = [];
        var items = cache.items;

        for (int i=0;i<items.length;i++) {
          if (items[i].team_member) {
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
          itemCount: min(8, filter.length),
          itemBuilder: (context, index) => PersonCardInfo(filter[index]),
        );
      },
    );
  }
}
