import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:visual_ai/content/content.dart';


class FirestoreApi {
  static bool Disabled = false;
  static const Map<String, bool> userSpecificPersonalData = {
    'training_data': true,
    'notos': true,
    'files': true,
    'profile': true,
    'users': false,
    'store': false,
    'adverts': false,
  };

  static void init() async {
    await Firebase.initializeApp();
  }

  static void create() async {
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

  static void download(
    String collection, {
      required void Function(dynamic) populate,
      String user_id = '',
      String team_id = '',
      String filters = '',
      int limit = 10,
    }
  ) async {

    try {

      dynamic query = FirebaseFirestore.instance.collection(collection);

      if (user_id != '' && team_id != '') {
        query = query
          .doc(user_id)
          .collection(team_id);
      }
      else if (userSpecificPersonalData[collection] ?? true) {
        print('Missing document in required DOCUMENT field');
        return;
      }

      if (filters != '') {
        query = query
          .where('uses', isGreaterThan: 20);
      }

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

    } catch (e) {
      print(e);
    }
  }

  static bool _allowed_upload = true;
  static void upload({
    required String collection,
    required DashboardContent content,
    String? user_id = FirestoreApi.active_user,
    String? team_id = FirestoreApi.active_team,
  }) {
    if (!_allowed_upload) return;

    if (user_id == null || team_id == null) return;

    if (!(userSpecificPersonalData[collection] ?? false)) return;

    CollectionReference reference = FirebaseFirestore.instance
      .collection(collection)
      .doc(user_id)
      .collection(team_id)
      .add(content.toJson());
      .then((value) => print('document added'))
      .catchError((error) => print("Failed to add user: $error"));
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
      return 'group0';
      // return await FirebaseFirestore.instance
      //   .collection('users')
      //   .doc(currentUser!)
      //   .get().data; // i dont know if this works
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
