import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';


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
          SwitchModeSettings(),
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
            style: TextStyle(color: Colors.white),
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
