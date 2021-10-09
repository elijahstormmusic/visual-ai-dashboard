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
import 'package:visual_ai/content/notifications/cache.dart';
import 'package:visual_ai/content/dashboard/cache.dart';
import 'package:visual_ai/content/files/cache.dart';



class _DrawSnapshot extends StatelessWidget {
  UserContent user;

  _DrawSnapshot(this.user);

  void upload_next(List<dynamic> list, int i) {
    if (i >= list.length) {
      print('finishing traindin data upload');
      return;
    }
    print('uploading ${i}');

    FirestoreApi.upload(list[i],
      onComplete: (_) {
        upload_next(list, i + 1);
      },
      onError: (e, _) {
        print('error: ${e}');
      }
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

      ElevatedButton(
        onPressed: () => upload_next(TrainingDataCache().getMockData(), 0),
        child: Text('Upload Mock Data'),
      ),

      // NumberSlideAnimation(
      //   number: Random().nextInt(1000).toString(),
      //   duration: const Duration(seconds: 1),
      //   curve: Curves.bounceIn,
      //   textStyle: TextStyle(
      //     fontSize: 20.0,
      //     fontWeight: FontWeight.bold
      //   ),
      // ),
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
