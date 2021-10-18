import 'package:flutter/material.dart';

import 'package:visual_ai/screens/components/animations/fade_animation.dart';

import 'package:visual_ai/constants.dart';
import 'components/main.dart';
import 'content.dart';


class TrainingDataContentDisplayPage extends StatefulWidget {
  final TrainingDataContent content;

  TrainingDataContentDisplayPage(this.content, {
    Key? key,
  }) : super(key: key);

  @override
  _TrainingDataContentDisplayPageState createState() => _TrainingDataContentDisplayPageState();
}

class _TrainingDataContentDisplayPageState extends State<TrainingDataContentDisplayPage> {

  Widget _infoBox(String info, {
    Color? backColor,
    Color? textColor,
  }) => Container(
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      color: backColor,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Center(
      child: Text(
        info,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  Widget _headerInfoColumn(String header, String info) => Column(
    children: [
      _infoBox(
        info,
        backColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      _infoBox(
        header,
        textColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.content.id,
          child: Stack(
            children: [
              Positioned.fill(
                child: widget.content.icon,
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).textTheme.subtitle1!.color!.withOpacity(.35),
                      blurRadius: 20,
                      offset: Offset(0, 30),
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: FadeAnimation(
                        delay: 1,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.0),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FadeAnimation(
                                delay: 1.2,
                                child: Row(
                                  children: [
                                    Text(
                                      widget.content.title,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        fontSize: 50,
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(width: defaultPadding),

                                    if (widget.content.approved)
                                      Icon(
                                        Icons.verified,
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        size: 30,
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: defaultPadding * 1.5),
                              FadeAnimation(
                                delay: 1.3,
                                child: Text(
                                  'by: ${widget.content.author_name}',
                                  style: TextStyle(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              FadeAnimation(
                                delay: 1.35,
                                child: Text(
                                  widget.content.caption,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: defaultPadding * 1.5),
                              Row(
                                children: [
                                  FadeAnimation(
                                    delay: 1.45,
                                    child: _headerInfoColumn('uses', widget.content.uses.toString()),
                                  ),
                                  SizedBox(width: defaultPadding / 2),
                                  FadeAnimation(
                                    delay: 1.46,
                                    child: _headerInfoColumn('encoding', widget.content.encoding),
                                  ),
                                  SizedBox(width: defaultPadding / 2),
                                  FadeAnimation(
                                    delay: 1.47,
                                    child: _headerInfoColumn('created', widget.content.created),
                                  ),
                                  SizedBox(width: defaultPadding / 2),
                                  FadeAnimation(
                                    delay: 1.48,
                                    child: _headerInfoColumn('edited', widget.content.edited),
                                  ),
                                ],
                              ),
                              SizedBox(height: defaultPadding),
                              FadeAnimation(
                                delay: 1.5,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit Data',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: defaultPadding / 2),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
