import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/pages/data/repository/auth_firebase_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AuthFirebaseRepository.signInAnonymously();
        },
      ),
    );
  }
}
