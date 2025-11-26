import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutes.todos.name);
              },
              child: Text("Ir al Módulo de Todos"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutes.country.name);
              },
              child: Text("Ir al Módulo de Paises"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutes.profile.name);
              },
              child: Text("Ir al Perfil"),
            ),
          ],
        ),
      ),
    );
  }
}
