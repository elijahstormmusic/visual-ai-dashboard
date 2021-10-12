import 'package:flutter/material.dart';

import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/constants.dart';


class BackablePage extends StatelessWidget {

  Widget _child;

  BackablePage({
    required child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Positioned.fill(
          child: _child,
        ),

        Positioned(
          top: defaultPadding,
          left: defaultPadding,
          child: CloseButton(
            // onPressed: () => Navigator.pushReplacementNamed(context, UI_Manager.routeName),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    ),
  );
}
