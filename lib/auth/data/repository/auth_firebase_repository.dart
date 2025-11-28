import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_cifo/auth/data/models/auth_dto.dart';
import 'package:firebase_flutter_cifo/auth/data/repository/user_firestore_repository.dart';

class AuthFirebaseRepository {
  static Future<AuthDto?> signInAnonymously() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInAnonymously();

      AuthDto myAuth = AuthDto.fromFirebaseUser(userCredential);

      return myAuth;
    } catch (e) {
      return null;
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<AuthDto?> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return AuthDto.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<AuthDto?> singUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return AuthDto.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<AuthDto?> currentUser() async {
    // final user = FirebaseAuth.instance.currentUser;
    final user = await UserFirestoreRepository().getUserById();

    print(user?.idUser);

    if (user == null) {
      return null;
    } else {
      return AuthDto(
        idUser: user.idUser,
        isAnonymous: user.isAnonymous,
        eamil: user.eamil,
        name: user.name,
        secondName: user.secondName,
        photoUrl: user.photoUrl,
        localPhotoPath: user.localPhotoPath,
      );
    }
  }
}
