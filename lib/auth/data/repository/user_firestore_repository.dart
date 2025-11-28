import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/auth/data/models/auth_dto.dart';
import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';

class UserFirestoreRepository {
  static Future<void> addNewUser({required AuthDto data}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(data.idUser)
        .set(data.toJson(), SetOptions(merge: true));
  }

  static Future<void> updateNewUser({required AuthDto data}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(data.idUser)
        .set(data.toJson(), SetOptions(merge: true));
  }

  Future<AuthDto?> getUserById() async {
    try {
      final query = await _getUserByIdFirebase();
      final users = query.docs.map((snapshot) => snapshot.data()).toList();
      final user = users.first;

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot<AuthDto>> _getUserByIdFirebase() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where('idUser', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .where(field)
        // .where(field)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AuthDto.fromJson(snapshot.data()!),
          toFirestore: (authModel, _) => authModel.toJson(),
        )
        .get();
  }

  static Future<void> uploadImageToFirestore(String downloadUrl) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(locator<StartAppCubit>().state.myCurrentUser!.idUser)
        .set({'photoUrl': downloadUrl}, SetOptions(merge: true));
  }
}
