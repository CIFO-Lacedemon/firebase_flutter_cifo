import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/helpers/validators_form.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

//TODO
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController(
      text: locator<StartAppCubit>().state.myCurrentUser?.name ?? '',
    );
    final TextEditingController secondNameController = TextEditingController(
      text: locator<StartAppCubit>().state.myCurrentUser?.secondName ?? '',
    );
    final ValidatorsForm validatorsForm = ValidatorsForm();
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
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        locator<StartAppCubit>()
                                .state
                                .myCurrentUser!
                                .localPhotoPath !=
                            null
                        ? FileImage(
                            File(
                              locator<StartAppCubit>()
                                  .state
                                  .myCurrentUser!
                                  .localPhotoPath!,
                            ),
                          )
                        : (locator<StartAppCubit>()
                                  .state
                                  .myCurrentUser!
                                  .photoUrl !=
                              null)
                        ? NetworkImage(
                            locator<StartAppCubit>()
                                .state
                                .myCurrentUser!
                                .photoUrl!,
                          )
                        : null,
                    child: Icon(Icons.person, size: 60),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            locator<StartAppCubit>().pickLocalImage(
                              ImageSource.camera,
                            );
                          },
                          icon: Icon(Icons.camera_alt),
                          label: Text("Cámara"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            locator<StartAppCubit>().pickLocalImage(
                              ImageSource.gallery,
                            );
                          },
                          icon: Icon(Icons.photo_library),
                          label: Text("Galeria"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await locator<StartAppCubit>().editPhotoUrl(
                        context,
                        locator<StartAppCubit>()
                            .state
                            .myCurrentUser!
                            .localPhotoPath,
                      );
                    },
                    icon: Icon(Icons.photo_library),
                    label: Text("Subir a Cloud Storage"),
                  ),
                  SizedBox(height: 40),
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

                  Text("Apellido del Usuario"),
                  TextFormField(
                    readOnly: (state.myCurrentUser?.secondName == null)
                        ? false
                        : true,
                    validator: validatorsForm.isValidName,
                    controller: secondNameController,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.secondName ??
                          'Introduce tu apellido',
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
                          secondName: secondNameController.text,
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
