import 'package:flutter/material.dart';

import 'package:visual_ai/ui_manager.dart';
import 'package:visual_ai/constants.dart';


class BackablePage extends StatelessWidget {

  Widget _child;
  AppBar? _appBar;

  BackablePage({
    required child,
    appBar,
  }) : _child = child,
      _appBar = appBar;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar,
    body: Stack(
      children: [
        Positioned.fill(
          child: _child,
        ),

        Positioned(
          top: defaultPadding,
          left: defaultPadding,
          child: CloseButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    ),
  );
}
