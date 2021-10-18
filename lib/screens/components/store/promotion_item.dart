import 'package:flutter/material.dart';

import 'package:visual_ai/constants.dart';

import 'package:visual_ai/content/store/content.dart';


class PromotionItem extends StatefulWidget {
  final StoreContent promotion;

  const PromotionItem(
    this.promotion, {
    Key? key,
  }) : super(key: key);

  @override
  _PromotionItemState createState() => _PromotionItemState();
}

class _PromotionItemState extends State<PromotionItem> {

  Widget _buildDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            // height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.promotion.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: defaultPadding),
                Expanded(
                  child: Text(
                    widget.promotion.caption,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  widget.promotion.released_str,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // await prefs.toggleBookmarked(DataType.sale, widget.promotion.id);
                  setState(() => 0);
                },
                child: FutureBuilder<bool>(
                  // future: prefs.isBookmarked(DataType.sale, widget.promotion.id),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
                    snapshot.hasData && snapshot.data!
                      ? Icon(
                        Icons.bookmark_border,
                      )
                      : Icon(
                        Icons.bookmark,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          offset: Offset(3, 8),
          blurRadius: 7,
          color: Theme.of(context).cardColor,
        )],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => widget.promotion.navigateTo(),
            fullscreenDialog: true,
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: Stack(
                    children: [
                      Semantics(
                        label: 'Logo for ${widget.promotion.title}',
                        child: widget.promotion.icon,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            // gradient:
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          'PROMOTION',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _buildDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
