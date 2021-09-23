import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreApi {
  static bool Disabled = false;

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
    String content,
    Map<String, dynamic> options,
    void Function(dynamic) populate,
  ) async {

    String collection = '',
            document = options['document'],
            group = options['group'];

    int limit = options['limit'] ?? 10;

    switch (content) {
      case 'training_data':
        collection = 'training_data';
        break;
      case 'users':
        collection = 'users';
        break;
      case 'notos':
        collection = 'notos';
        break;
      case 'files':
        collection = 'files';
        break;
      case 'profile':
        collection = 'profile';
        break;
      case 'store':
        collection = 'store';
        break;
      case 'adverts':
        collection = 'adverts';
        break;
      default:
        break;
    }

    if (group == null) return;
    if (document == null) return;
    if (collection == '') return;

    try {

      FirebaseFirestore.instance
        .collection(collection)
        .doc(document)
        .collection(group)
        // .where('uses', isGreaterThan: 20)
        .limit(limit)
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            populate(doc);
          });
        });

    } catch (e) {
      print('error exception');
      print(e);
    }

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
