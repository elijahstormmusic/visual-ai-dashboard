import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/screens/main/screen.dart';
import 'package:visual_ai/constants.dart';


class SideMenu extends StatelessWidget {

  ValueNotifier stateIndex;

  SideMenu(
    this.stateIndex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Constants.logo_asset),
                SizedBox(width: defaultPadding * 0.5),
                Text(
                  Constants.appName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: 'Dashboard',
            svgSrc: 'assets/icons/menu_dashbord.svg',
            press: () {
              stateIndex.value = 'Dashboard';
            },
          ),
          DrawerListTile(
            title: 'Performance',
            svgSrc: 'assets/icons/menu_tran.svg',
            press: () {
              stateIndex.value = 'Performance';
            },
          ),
          DrawerListTile(
            title: 'Training',
            svgSrc: 'assets/icons/menu_task.svg',
            press: () {
              stateIndex.value = 'Training';
            },
          ),
          DrawerListTile(
            title: 'Database',
            svgSrc: 'assets/icons/menu_doc.svg',
            press: () {
              stateIndex.value = 'Database';
            },
          ),
          DrawerListTile(
            title: 'Store',
            svgSrc: 'assets/icons/menu_store.svg',
            press: () {
              stateIndex.value = 'Store';
            },
          ),
          DrawerListTile(
            title: 'Notification',
            svgSrc: 'assets/icons/menu_notification.svg',
            press: () {
              stateIndex.value = 'Notification';
            },
          ),
          DrawerListTile(
            title: 'Profile',
            svgSrc: 'assets/icons/menu_profile.svg',
            press: () {
              stateIndex.value = 'Profile';
            },
          ),
          DrawerListTile(
            title: 'Settings',
            svgSrc: 'assets/icons/menu_setting.svg',
            press: () {
              stateIndex.value = 'Settings';
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (!Responsive.isDesktop(context))
          Navigator.pop(context);
        press();
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        height: 16,
        color: Theme.of(context).iconTheme.color!,
      ),
      title: Opacity(
        opacity: 0.8,
        child: Text(
          title,
        ),
      ),
    );
  }
}
