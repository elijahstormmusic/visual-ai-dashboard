import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'file_info_card.dart';


class NoContentPlaceholder extends StatelessWidget {
  const NoContentPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlinkingContent(
                child: Text(
                  'Awaiting Content...',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              // ElevatedButton.icon(
              //   style: TextButton.styleFrom(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: defaultPadding * 1.5,
              //       vertical:
              //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              //     ),
              //   ),
              //   onPressed: () {},
              //   icon: Icon(Icons.add),
              //   label: Text('Add New'),
              // ),
            ],
          ),
          SizedBox(height: defaultPadding),
          Responsive(
            mobile: NoContentFunSquare(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: NoContentFunSquare(),
            desktop: NoContentFunSquare(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class NoContentFunSquare extends StatelessWidget {
  const NoContentFunSquare({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white),
          // borderRadius: BorderRadius.all(
          //   Radius.circular(5.0),
          // ),
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SpinKitDancingSquare(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

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
