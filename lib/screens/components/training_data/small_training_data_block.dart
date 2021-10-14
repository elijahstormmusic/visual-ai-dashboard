import 'package:flutter/material.dart';

import 'package:visual_ai/screens/components/animations/fade_animation.dart';

import 'package:visual_ai/content/training_data/content.dart';
import 'package:visual_ai/constants.dart';


class SmallTrainingDataBlock extends StatelessWidget {
  const SmallTrainingDataBlock(
    this.info, {
    Key? key,
  }) : super(key: key);

  final TrainingDataContent info;

  Widget makeItem(BuildContext context, TrainingDataContent info) {
    return Hero(
      tag: info.id,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => info.navigateTo()),
          );
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: info.icon,
            ),

            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).textTheme.subtitle1!.color!.withOpacity(.4),
                    blurRadius: 10,
                    offset: Offset(0, 10)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeAnimation(
                              1,
                              Text(
                                info.title,
                                style: TextStyle(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  fontSize: 24,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            FadeAnimation(
                              1.1,
                              Text(
                                '${info.author_name}',
                                style: TextStyle(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeAnimation(
                        1.2,
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: Theme.of(context).iconTheme.color,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (info.approved)
                    FadeAnimation(
                      1.2,
                      Icon(
                        Icons.verified,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => info.navigateTo()),
        ),
        child: makeItem(context, info),
      ),
    );
  }
}
