import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/helpers/validators_form.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController(
      text: locator<StartAppCubit>().state.myCurrentUser?.name ?? '',
    );
    ValidatorsForm validatorsForm = ValidatorsForm();
    return BlocBuilder<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Text("Nombre del Usuario"),
                  TextFormField(
                    controller: nameController,
                    validator: validatorsForm.isValidName,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.name ?? 'Introduce un nombre',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email del Usuario"),
                  TextFormField(
                    readOnly: (state.myCurrentUser?.eamil == null)
                        ? false
                        : true,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.eamil ?? 'Introduce un email',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        locator<StartAppCubit>().editUser(
                          name: nameController.text,
                        );
                        context.pop();
                      }
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
