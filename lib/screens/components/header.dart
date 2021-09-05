import 'package:visual_ai/controllers/MenuController.dart';
import 'package:visual_ai/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/constants.dart';

class Header extends StatefulWidget {

  String title;

  Header(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {

  bool _showMenuOptions = false;
  void _openMenuOptions() {
    setState(() => _showMenuOptions = !_showMenuOptions);
  }

  Widget _drawMenuOptions() => AnimatedSize(
    duration: Duration(milliseconds: 250),
    curve: Curves.easeOut,
    vsync: this,
    child: Container(
      padding: EdgeInsets.only(top: defaultPadding),
      constraints: _showMenuOptions
        ? BoxConstraints(maxHeight: double.infinity)
        : BoxConstraints(maxHeight: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // if (!Responsive.isMobile(context))
            // SizedBox(width: 3 * MediaQuery.of(context).size.width / 4),

          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Account Permissions'),
                      SizedBox(width: defaultPadding),
                      Icon(Icons.add),
                    ],
                  ),
                ),

                SizedBox(height: defaultPadding),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Billing'),
                      SizedBox(width: defaultPadding),
                      Icon(Icons.attach_money),
                    ],
                  ),
                ),

                SizedBox(height: defaultPadding),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Account Settings'),
                      SizedBox(width: defaultPadding),
                      Icon(Icons.settings),
                    ],
                  ),
                ),

                SizedBox(height: defaultPadding),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Log Out'),
                      SizedBox(width: defaultPadding),
                      Icon(Icons.exit_to_app),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: context.read<MenuController>().controlMenu,
              ),
            if (!Responsive.isMobile(context))
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            Expanded(child: SearchField()),
            ProfileCard(_openMenuOptions)
          ],
        ),

        _drawMenuOptions(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {

  VoidCallback _openMenuOptionsAction;

  ProfileCard(
    this._openMenuOptionsAction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openMenuOptionsAction,
      child: Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            SvgPicture.network(
              UserState.Pic,
              height: 38,
            ),
            if (!Responsive.isMobile(context))
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text(UserState.User),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
        ),
      ),
    );
  }
}
