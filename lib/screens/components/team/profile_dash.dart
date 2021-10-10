import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/firestore/firestore.dart';
import 'package:visual_ai/content/users/content.dart';
import 'package:visual_ai/login/user_state.dart';
import 'package:visual_ai/constants.dart';

import 'package:visual_ai/screens/components/loading.dart';
import 'package:visual_ai/screens/components/error.dart';


import 'package:visual_ai/content/training_data/cache.dart';
import 'package:visual_ai/content/training_data/content.dart';
import 'package:visual_ai/content/notifications/cache.dart';
import 'package:visual_ai/content/dashboard/cache.dart';
import 'package:visual_ai/content/files/cache.dart';
import 'package:visual_ai/content/files/content.dart';



class _DrawSnapshot extends StatelessWidget {
  UserContent user;

  _DrawSnapshot(this.user);




  void upload_next(List<dynamic> list, int i) {
    if (i >= list.length) {
      return;
    }

    FirestoreApi.upload(list[i],
      onComplete: (_) {
        upload_next(list, i + 1);
      },
      onError: (e, _) {
        print('error: ${e}');
      }
    );
  }


  Widget _rowWithData({
    required String label,
    required String field,
    required String collection,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),

        FirestoreApi.future(
          field: field,
          id: FirestoreApi.active_user!,
          collection: collection,
          document: 'info',
          builder: (context, data) {

            try {
              String str = data.toString();

              int position = 0;
              for (; position < str.length; position++) {
                try {
                  int.parse(str[position]);
                }
                catch (e) {
                  break;
                }
              }

              if (position == str.length) {
                return NumberSlideAnimation(
                  number: str,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceIn,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                );
              }

              return Row(
                children: [
                  NumberSlideAnimation(
                    number: str.substring(0, position),
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    str.substring(position),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }
            catch (e) {
              return Text(
                data,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
          onError: (e) {
            return Text(
              'No data',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    var active_user = FirestoreApi.active_user_information;

    if (active_user == null) return Consumer<UserState>(
      builder: (context, userstate, child) {
        return ErrorDisplay(
          'Please make sure you are logged in',
          retry_prompt: 'Log Back In',
          retry: () {
            userstate.logout();
          },
        );
      },
    );

    List<Widget> _widgetList = [
      Row(
        children: [
          Container(
            width: 150,
            height: 150,
            child: active_user.photoURL != null
              ? Image.network(active_user.photoURL!)
              : user.icon,
          ),

          SizedBox(width: defaultPadding),

          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: '${active_user.displayName ?? user.title}   ',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).iconTheme.color,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${user.sex}',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(active_user.email ?? 'no email'),
              ],
            ),
          ),
        ],
      ),

      Text(user.caption),

      _rowWithData(
        label: 'Training Data Documents',
        collection: TrainingDataContent.CollectionName,
        field: 'numOfDocs',
      ),

      _rowWithData(
        label: 'Amount of Files',
        collection: FileContent.CollectionName,
        field: 'numOfDocs',
      ),

      _rowWithData(
        label: 'Total File Size',
        collection: FileContent.CollectionName,
        field: 'totalFileSize',
      ),

      ElevatedButton(
        onPressed: () => upload_next(
          <dynamic>[]
            + TrainingDataCache().getMockData()
            + NotificationCache().getMockData()
            + FileCache().getMockData()
            + DashboardCache().getMockData(), 0),
        child: Text('Upload Mock Data'),
      ),
    ];

    return AnimationLimiter(
      child: ListView.builder(
        itemCount: _widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _AnimatedEditableBox(_widgetList[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AnimatedEditableBox extends StatefulWidget {
  Widget child;

  _AnimatedEditableBox(this.child);

  @override
  _StateAnimatedEditableBox createState() => _StateAnimatedEditableBox();
}

class _StateAnimatedEditableBox extends State<_AnimatedEditableBox> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    curve: Curves.ease,
    duration: const Duration(milliseconds: 500),
    padding: EdgeInsets.all(defaultPadding),
    margin: EdgeInsets.only(bottom: defaultPadding),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      color: _selected
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).scaffoldBackgroundColor,
    ),
    child: widget.child,
  );
}

class DashboardProfileDisplay extends StatelessWidget {
  const DashboardProfileDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(defaultPadding),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirestoreApi.stream('users',
              id: FirestoreApi.active_user,
            ),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Consumer<UserState>(
                  builder: (context, userstate, child) {
                    return ErrorDisplay(
                      'Something went wrong... if you keep seeing this, try logging out and logging back in',
                      retry: () {
                        userstate.notify();
                      },
                    );
                  },
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }

              var document = snapshot.data!;

              if (!document.exists || document.data() == null) {
                return Consumer<UserState>(
                  builder: (context, userstate, child) {
                    return ErrorDisplay(
                      'Please make sure you are logged in',
                      retry_prompt: 'Log Back In',
                      retry: () {
                        userstate.logout();
                      },
                    );
                  },
                );
              }

              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              data['id'] = FirestoreApi.active_user;

              return _DrawSnapshot(
                UserContent.fromJson(
                  data,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
