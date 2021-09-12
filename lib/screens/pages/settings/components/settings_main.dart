import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/theme.dart';


class DashSettingsMain extends StatelessWidget {
  const DashSettingsMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Main Settings',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Change visual brightness'),

                    ThemeSwitcher(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Theme.of(context).primaryColor),
                        ),
                        padding: EdgeInsets.all(defaultPadding * 0.75),
                        child: StoreConnector<AppState, bool>(
                          distinct: true,
                          converter: (store) => store.state.enableDarkMode,
                          builder: (_, bool enableDarkMode) {
                            return Text('${enableDarkMode ? 'Light' : 'Dark'} Mode');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 5,
                  ),
                  width: double.infinity,
                  height: 1,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: defaultPadding * 0.5),
                SwitchModeSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class SwitchModeSettings extends StatefulWidget {
  @override
  _StateSwitchModeSettings createState() => _StateSwitchModeSettings();
}

class _StateSwitchModeSettings extends State<SwitchModeSettings> {
  List<Product> _products = [
    Product(name: 'LED Submersible Lights', enable: true),
    Product(name: 'Portable Projector', enable: true),
    Product(name: 'Bluetooth Speaker', enable: true),
    Product(name: 'Smart Watch', enable: true),
    Product(name: 'Temporary Tattoos', enable: true),
    Product(name: 'Bookends', enable: true),
    Product(name: 'Vegetable Chopper', enable: true),
    Product(name: 'Neck Massager', enable: true),
    Product(name: 'Facial Cleanser', enable: true),
    Product(name: 'Back Cushion', enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _products.length,
        (index) => SwitchListTile.adaptive(
          title: Text(
            _products[index].name,
          ),
          value: _products[index].enable,
          onChanged: (newValue) {
            setState(() {
              _products[index].enable = newValue;
            });
          },
        ),
      ),
    );
  }
}
