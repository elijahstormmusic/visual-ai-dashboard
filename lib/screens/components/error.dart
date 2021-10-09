import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:visual_ai/constants.dart';


class ErrorDisplay extends StatelessWidget {
  String _err, title, retry_prompt;
  VoidCallback? retry;

  ErrorDisplay(this._err, {
    this.title = 'Ooops! 😓',
    this.retry,
    this.retry_prompt = 'Try Again',
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: defaultPadding,
    ),
    child: Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 200,
              child: Image.asset('assets/images/no-connection.gif'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultPadding * 2,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: defaultPadding),
                Text(
                  _err,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: defaultPadding * 2),
                if (retry != null)
                  MaterialButton(
                    onPressed: retry,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      retry_prompt,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
