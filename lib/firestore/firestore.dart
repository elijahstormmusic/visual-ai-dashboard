import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:visual_ai/content/content.dart';


class FirestoreApi {
  static bool Disabled = false;

  static void init() async {
    await Firebase.initializeApp();
  }



  static void createNewUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!"
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user!= null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void updateUserProfile({
    String? displayName,
    String? photoURL,
    String? email,
  }) async {
    User? active = FirestoreApi.active_user_information;

    if (active == null) return;

    if (photoURL != null) {
      await active.updatePhotoURL(photoURL);
    }

    if (email != null) {
      await active.updateEmail(email);
    }

    if (displayName != null) {
      await active.updateDisplayName(displayName);
    }

    await active.reload();
  }

  static void login(ResponseData response) async {

    try {

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: response.user,
        password: response.pass,
      );

      response.failure = null;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        response.failure = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        response.failure = 'Wrong password provided for that user.';
      }
    }

    response.validated = true;
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }



  static bool _restrict_uploads = false;
  static bool _deny_upload() {
    return Disabled || _restrict_uploads;
  }

  static void _grab(
    dynamic query,
    int limit,
    void Function(dynamic) populate
  ) {
    query
      .limit(limit)
      .get()
      .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        querySnapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
          if (!doc.exists) return;

          Map<String, dynamic> data = doc.data()!;
          try {
            data['id'] = doc.id;
          } catch (e) {}

          if (data['id'] == 'info') return;

          try {
            populate(data);
          }
          catch (e) {
            print(e);
          }
        });
      });
  }
  static dynamic _filter(dynamic query, String filters) {

    query = query
      .where('uses', isGreaterThan: 20);

    return query;
  }
  static void _getPersonalData({
    required void Function(dynamic) populate,
    required String type,
    required String access,
    required String collection,
    required String filters,
    required int limit,
  }) {
    try {
      dynamic query = FirebaseFirestore.instance.collection(type)
        .doc(access)
        .collection(collection);

      if (filters != '') {
        query = _filter(filters, query);
      }

      _grab(query, limit, populate);
    } catch (e) {
      print(e);
    }
  }
  static void _getContent({
    required void Function(dynamic) populate,
    required String collection,
    required String filters,
    required int limit,
  }) {
    try {
      dynamic query = FirebaseFirestore.instance.collection(collection);

      if (filters != '') {
        query = _filter(query, filters);
      }

      _grab(query, limit, populate);
    } catch (e) {
      print(e);
    }
  }

  static void download(
    String collection, {
      required void Function(dynamic) populate,
      String? id,
      bool is_team = false,
      String filters = '',
      int limit = 10,
    }
  ) {
    if (id != null) {
      _getPersonalData(
        type: is_team ? 'teams' : 'users',
        access: id,
        collection: collection,
        filters: filters,
        limit: limit,
        populate: populate,
      );
    }
    else {
      _getContent(
        collection: collection,
        filters: filters,
        limit: limit,
        populate: populate,
      );
    }
  }

  static Widget future({
    required String field,
    required String id,
    String? collection,
    String? document,
    bool is_team = false,
    required Widget Function(BuildContext, dynamic) builder,
    required Widget Function(String) onError,
  }) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirestoreApi.get(
        field: field,
        id: id,
        collection: collection,
        document: document,
        is_team: is_team,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return onError('FirestoreApi->future Error: ${snapshot.error}');
        }

        if (!snapshot.data!.exists || snapshot.data!.data()![field] == null) {
          return onError('FirestoreApi->future Error: data does not exist');
        }

        return builder(context, snapshot.data!.data()![field]);
      },
    );
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> get({
    required String field,
    required String id,
    String? collection,
    String? document,
    bool is_team = false,
  }) async {
    var query = await FirebaseFirestore.instance
      .collection(is_team ? 'teams' : 'users')
      .doc(id);

    if (collection != null && document != null) {
      query = query
        .collection(collection)
        .doc(document);
    }

    return query.get();
  }

  static Stream<DocumentSnapshot> stream(
    String collection, {
      String? id,
      String? document,
      bool is_team = false,
  }) {
    var database = FirebaseFirestore.instance
      .collection(collection)
      .doc(id);

    return database.snapshots();
  }

  static void upload(
    ContentContainer content, {
      String? id,
      bool is_team = false,
      void Function(ContentContainer)? onComplete,
      void Function(String, ContentContainer)? onError,
    }
  ) async {
    if (_deny_upload()) {
      if (onError != null) {
        onError('Upload denied by FirebaseAPI', content);
      }
      return;
    }

    if (id == null) {
      if (is_team) {
        id = await FirestoreApi.active_team;
      }
      else {
        id = FirestoreApi.active_user;
      }

      if (id == null) {
        if (onError != null) {
          onError('Uploader ID could not be auto-generated', content);
        }
        return;
      }
    }

    Map<String, dynamic> _uploadable_data = content.toJson();

    await FirebaseFirestore.instance
      .collection(is_team ? 'teams' : 'users')
      .doc(id)
      .collection(content.collection)
      .add(_uploadable_data)
      .then(
        (value) {
          if (onComplete != null) onComplete(content);

          var doc_counting = FirebaseFirestore.instance
            .collection(is_team ? 'teams' : 'users')
            .doc(id)
            .collection(content.collection)
            .doc('info');

          doc_counting
            .update({'numOfDocs': FieldValue.increment(1)})
            .catchError(
              (error) {
                doc_counting
                  .set({'numOfDocs': 1}, SetOptions(merge: true))
                  .catchError(
                    (error) {
                      if (onError != null) onError('$error', content);
                    }
                  );
              }
            );
        }
      )
      .catchError(
        (error) {
          if (onError != null) onError('$error', content);
        }
      );
  }

  static User? get active_user_information {
    return FirebaseAuth.instance.currentUser;
  }
  static String? get active_user {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return currentUser.uid;
    }

    return null;
  }
  static Future<String?> get active_team async {
    String? currentUser = FirestoreApi.active_user;

    if (currentUser != null) {
      return
      (
        (
          await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser)
            .get()
        )
        .data() ?? {}
      )['active_team'];
    }

    return null;
  }
}

class ResponseData {

  String user, pass;
  bool validated = false;
  String? failure = 'Check the network connection';

  ResponseData({
    required this.user,
    required this.pass,
  });
}
