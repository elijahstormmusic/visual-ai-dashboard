import 'package:flutter/material.dart';


class BlinkingContent extends StatefulWidget {

  Widget child;

  BlinkingContent({
    required this.child,
  });

  @override
  _BlinkingContentState createState() => _BlinkingContentState();
}

class _BlinkingContentState extends State<BlinkingContent>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 1400),
          lowerBound: .3,
        );
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      child: widget.child,
    );
  }
}
