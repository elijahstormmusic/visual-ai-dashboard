import 'package:flutter/material.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/animations/blinking_content.dart';

import 'package:visual_ai/content/store/content.dart';


class PromotionItem extends StatelessWidget {
  const PromotionItem(
    this.promotion, {
    Key? key,
  }) : super(key: key);

  final StoreContent promotion;


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
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  promotion.title,
                  style: Styles.saleTitle,
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: Text(
                    promotion.caption,
                    style: Styles.saleInfo,
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
                width: 130,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  promotion.released_str,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.saleOwner,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await widget.prefs.toggleBookmarked(DataType.sale, promotion.id);
                  setState(() => 0);
                },
                child: FutureBuilder<bool>(
                  future: widget.prefs.isBookmarked(DataType.sale, promotion.id),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
                    snapshot.hasData ?
                    (snapshot.data ? Styles.bookmark_filled : Styles.bookmark_icon)
                    : Styles.bookmark_icon,
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
      padding: EdgeInsets.only(left: 16, right: 16),
      width: 220,
      height: 300,
      margin: const EdgeInsets.only(bottom: 10),
      child: PressableCard(
        onPressed: () {
          Arrival.navigator.currentState.push(MaterialPageRoute(
            builder: (context) => promotion.navigateTo(),
            fullscreenDialog: true,
          ));
        },
        color: Styles.ArrivalPalletteWhite,
        upElevation: 5,
        downElevation: 1,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 150,
              child: Stack(
                children: [
                  Semantics(
                    label: 'Logo for ${promotion.title}',
                    child: promotion.icon,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'PROMOTION',
                      style: Styles.saleCardType,
                    ),
                  ),
                ],
              ),
            ),

            _buildDetails(),
          ],
        ),
      ),
    );
  }
}
