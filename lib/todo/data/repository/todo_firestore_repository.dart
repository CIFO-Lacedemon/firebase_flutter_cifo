import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';

class TodoFirestoreRepository {
  static Future<void> addNewTodo({required TodoDto data}) async {
    await FirebaseFirestore.instance
        .collection("todos")
        .doc(data.id)
        .set(data.toJson(), SetOptions(merge: true));
  }

  Future<List<TodoDto>?>? getTodosByUserID() async {
    try {
      final query = await _getTodoByUserIdFirebase();
      final todos = query.docs.map((snapshot) => snapshot.data()).toList();

      return todos;
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot<TodoDto>> _getTodoByUserIdFirebase() async {
    return await FirebaseFirestore.instance
        .collection("todos")
        .where('idUser', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .where(field)
        // .where(field)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              TodoDto.fromJson(snapshot.data()!),
          toFirestore: (authModel, _) => authModel.toJson(),
        )
        .get();
  }

  Future<void> removeTodo({required TodoDto data}) async {
    await FirebaseFirestore.instance.collection("todos").doc(data.id).delete();
  }

  static Future<void> editTodo({required TodoDto data}) async {
    await FirebaseFirestore.instance
        .collection("todos")
        .doc(data.id)
        .set(data.toJson(), SetOptions(merge: true));
  }
}
