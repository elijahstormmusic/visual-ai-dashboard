import 'package:flutter/material.dart';
import 'package:visual_ai/models/DashboardFiles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visual_ai/constants.dart';


class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  Color _cardInteriorColor(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    switch (info.type) {
      case 'document':
        color = Theme.of(context).primaryColor;
        break;
      case 'google':
        color = Color(0xFFFFA113);
        break;
      case 'one drive':
        color = Color(0xFFA4CDFF);
        break;
      case 'dropbox':
        color = Color(0xFF007EE5);
        break;
      default:
        color = Theme.of(context).primaryColor;
        break;
    }

    return color;
  }
  String _cardInteriorSvg(BuildContext context) {
    String asset = 'assets/icons/Documents.svg';

    switch (info.type) {
      case 'document':
        asset = 'assets/icons/Documents.svg';
        break;
      case 'google':
        asset = 'assets/icons/google_drive.svg';
        break;
      case 'one drive':
        asset = 'assets/icons/one_drive.svg';
        break;
      case 'dropbox':
        asset = 'assets/icons/drop_box.svg';
        break;
      default:
        asset = 'assets/icons/Documents.svg';
        break;
    }

    return asset;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: _cardInteriorColor(context).withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  _cardInteriorSvg(context),
                  color: _cardInteriorColor(context),
                ),
              ),
              Icon(Icons.more_vert)
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: _cardInteriorColor(context),
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.8,
                child: Text(
                  '${info.numOfFiles} Files',
                ),
              ),
              Text(
                info.totalStorage!,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColorDark,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
