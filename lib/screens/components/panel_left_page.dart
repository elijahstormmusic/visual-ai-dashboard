import 'package:flutter/material.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'charts.dart';


class PanelLeftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (Responsive.isDesktop(context))
          Container(
            color: Colors.purple,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
            ),
          ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                width: double.infinity,
                child: ListTile(
                  //leading: Icon(Icons.shopping_basket),
                  title: Text(
                    'Products Sold',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '18% of Products Sold',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      '4,500',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: defaultPadding),

            LineChartSample2(),

            SizedBox(height: defaultPadding),

            PieChartSample2(),
          ],
        ),
      ],
    );
  }
}
