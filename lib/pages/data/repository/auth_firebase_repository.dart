import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseRepository {
  static Future<UserCredential?> signInAnonymously() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInAnonymously();

      return userCredential;
    } catch (e) {
      return userCredential;
    }
  }
}
