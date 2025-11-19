import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterEmailFormWidget extends StatelessWidget {
  RegisterEmailFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repitPasswordController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Introduzca el Email"),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Introduzca su contraseña"),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: repitPasswordController,
            decoration: InputDecoration(hintText: "Repita su contraseña"),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              // context.goNamed(AppRoutes.home.name);
              locator<StartAppCubit>().signUpWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
