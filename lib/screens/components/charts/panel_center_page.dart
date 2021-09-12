import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:visual_ai/constants.dart';
import 'charts.dart';


class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelCenterPage extends StatefulWidget {
  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {

  @override
  Widget build(BuildContext context) {
    List<Todo> _todos = [
      Todo(name: 'Purchase Paper', enable: true),
      Todo(name: 'Refill the inventory of speakers', enable: true),
      Todo(name: 'Hire someone', enable: true),
      Todo(name: 'Maketing Strategy', enable: true),
      Todo(name: 'Selling furniture', enable: true),
      Todo(name: 'Finish the disclosure', enable: true),
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: Icon(Icons.sell),
            title: Text(
              'Products Available',
            ),
            subtitle: Text(
              '82% of Products Avail.',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: Chip(
              label: Text(
                '20,500',
              ),
            ),
          ),
        ),

        SizedBox(height: defaultPadding),

        BarChartSample2(),

        SizedBox(height: defaultPadding),

        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: List.generate(
              _todos.length,
              (index) => CheckboxListTile(
                title: Text(
                  _todos[index].name,
                ),
                value: _todos[index].enable,
                onChanged: (newValue) {
                  setState(() {
                    _todos[index].enable = newValue ?? true;
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
