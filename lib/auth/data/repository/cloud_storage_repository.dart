import 'dart:io';
import 'package:firebase_flutter_cifo/auth/data/repository/user_firestore_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CloudStorageRepository {
  final storage = FirebaseStorage.instance;
  //Subir imagen a Firebase Storage
  Future<String?> uploadImage(
    BuildContext context,
    String? imagePath,
    String? uid,
  ) async {
    try {
      if (imagePath == null) {
        //TODO
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Imagen no seleccionada")));
        return null;
      }

      // Ruta en Cloud Storage
      final ref = storage.ref().child('profiles/$uid');

      //Subida del archivo
      await ref.putFile(File(imagePath));

      //Obtener url de descarga
      final downloadUrl = await ref.getDownloadURL();

      print(downloadUrl);

      //Guardar la URL en Firestore
      UserFirestoreRepository.uploadImageToFirestore(downloadUrl);

      return downloadUrl;
    } catch (e) {
      print("$e");
      return null;
    }
  }
}
