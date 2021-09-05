import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/models/Persons.dart';
import 'package:visual_ai/constants.dart';


class PersonCardInfo extends StatelessWidget {
  const PersonCardInfo({
    Key? key,
    required this.info,
  }) : super(key: key);

  final PersonInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding * (Responsive.isMoble(context) ? 1 : 0.25)),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * (Responsive.isMoble(context) ? 0.75 : 0.25)),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.network(
                  info.svgSrc!,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            info.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "${info.numOfFiles} Files",
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white70),
          //     ),
          //     Text(
          //       info.totalStorage!,
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
