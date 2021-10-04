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



  static bool _restrict_uploads = true;
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
      .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc.exists) {
            populate(doc);
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

  static void upload(
    ContentContainer content, {
      String? id,
      bool is_team = false,
      void Function(ContentContainer)? onComplete,
      void Function(String, ContentContainer)? onError,
    }
  ) async {
    if (_deny_upload()) return;

    if (id == null) {
      if (is_team) {
        id = FirestoreApi.active_user;
      }
      else {
        id = await FirestoreApi.active_team;
      }
      if (id == null) return;
    }

    FirebaseFirestore.instance
      .collection(is_team ? 'teams' : 'users')
      .doc(id)
      .collection(content.collection)
      .add(content.toJson())
      .then(
        (value) {
          if (onComplete != null) onComplete(content);
        }
      )
      .catchError(
        (error) {
          if (onError != null) onError('$error', content);
        }
      );
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
