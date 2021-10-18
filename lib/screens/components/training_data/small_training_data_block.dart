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
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).textTheme.subtitle1!.color!.withOpacity(.35),
                    blurRadius: 15,
                    offset: Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FadeAnimation(
                          delay: 1,
                          child: Text(
                            info.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (info.approved)
                        FadeAnimation(
                          delay: 1.1,
                          child: Icon(
                            Icons.verified,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: defaultPadding / 3),
                  FadeAnimation(
                    delay: 1.1,
                    child: Text(
                      '${info.author_name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  SizedBox(height: defaultPadding),
                  FadeAnimation(
                    delay: 1.2,
                    child: Text(
                      '${info.caption}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: defaultPadding,
              bottom: defaultPadding,
              child: FadeAnimation(
                delay: 1.3,
                child: Container(
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
