import 'package:flutter/material.dart';

import 'package:visual_ai/constants.dart';
import 'charts.dart';


class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
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
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              'Net Revenue',
            ),
            subtitle: Text(
              '7% of Sales Avg.',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: Chip(
              label: Text(
                r'$46,450',
              ),
            ),
          ),
        ),

        SizedBox(height: defaultPadding),

        LineChartSample1(),

        SizedBox(height: defaultPadding),

        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
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
          ),
        ),
      ],
    );
  }
}
