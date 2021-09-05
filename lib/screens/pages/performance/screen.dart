import 'package:flutter/material.dart';
import 'package:visual_ai/responsive.dart';

import 'package:visual_ai/screens/components/header.dart';
import 'package:visual_ai/screens/components/panel_left_page.dart';
import 'package:visual_ai/screens/components/panel_right_page.dart';
import 'package:visual_ai/screens/components/panel_center_page.dart';
import 'package:visual_ai/constants.dart';



class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header('Performance'),
            SizedBox(height: defaultPadding),
            
            if (Responsive.isMobile(context))
              Column(
                children: [
                  PanelCenterPage(),
                  SizedBox(height: defaultPadding),
                  PanelLeftPage(),
                  SizedBox(height: defaultPadding),
                  PanelRightPage(),
                ],
              ),

            if (!Responsive.isMobile(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: PanelCenterPage(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    flex: 3,
                    child: PanelLeftPage(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    flex: 3,
                    child: PanelRightPage(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
