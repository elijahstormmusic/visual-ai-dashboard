import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';


class DashSettingsTeam extends StatelessWidget {
  const DashSettingsTeam({
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
                'Team Settings',
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
                CheckBoxSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class CheckBoxSettings extends StatefulWidget {
  @override
  _StateCheckBoxSettings createState() => _StateCheckBoxSettings();
}

class _StateCheckBoxSettings extends State<CheckBoxSettings> {
  List<Todo> _todos = [
    Todo(name: 'Purchase Paper', enable: true),
    Todo(name: 'Refill the inventory of speakers', enable: true),
    Todo(name: 'Hire someone', enable: true),
    Todo(name: 'Maketing Strategy', enable: true),
    Todo(name: 'Selling furniture', enable: true),
    Todo(name: 'Finish the disclosure', enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
