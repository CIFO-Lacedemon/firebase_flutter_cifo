//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/auth/data/repository/user_firestore_repository.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:firebase_flutter_cifo/auth/data/models/auth_dto.dart';
import 'package:firebase_flutter_cifo/auth/data/repository/auth_firebase_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit() : super(StartAppState());

  Future<void> init() async {
    final authDto = await AuthFirebaseRepository.currentUser();

    if (authDto?.idUser != null) {
      print("Este usuario está logueado");

      emit(state.copyWith(isLoged: true));
      await getUserById();
    } else {
      print("Este usuario no está logueado");
      emit(state.copyWith(isLoged: false));
    }
  }

  Future<void> loginSesion() async {
    emit(state.copyWith(isLoged: true));
  }

  Future<void> logOutSesion() async {
    await AuthFirebaseRepository.logOut();
    emit(state.copyWith(isLoged: false));
  }

  Future<void> signInAnonymously() async {
    AuthDto? myUserCredential =
        await AuthFirebaseRepository.signInAnonymously();

    if (myUserCredential?.isAnonymous == true) {
      emit(state.copyWith(isLoged: true));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    AuthDto? myUserCredential =
        await AuthFirebaseRepository.singInWithEmailAndPassword(
          email: email,
          password: password,
        );
    if (myUserCredential?.idUser != null) {
      emit(state.copyWith(isLoged: true));
    }
    await getUserById();
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    AuthDto? myUserCredential =
        await AuthFirebaseRepository.singUpWithEmailAndPassword(
          email: email,
          password: password,
        );
    if (myUserCredential?.idUser != null) {
      await UserFirestoreRepository.addNewUser(data: myUserCredential!);
      emit(state.copyWith(isLoged: true));
    }
    await getUserById();
  }

  Future<void> getUserById() async {
    AuthDto? myUser = await UserFirestoreRepository().getUserById();
    print(myUser!.eamil);
    emit(state.copyWith(myCurrentUser: myUser));
  }

  void toggleShowLoginPass(bool? isValue) {
    bool showPass = !state.isObscureTextPassLogin;
    emit(state.copyWith(isObscureTextPassLogin: showPass));

    if (isValue != null) {
      emit(state.copyWith(isObscureTextPassLogin: isValue));
    }
  }

  void toggleShowRegisterPass() {
    bool showPass = !state.isObscureTextPassRegister;
    emit(state.copyWith(isObscureTextPassRegister: showPass));
  }

  void toggleShowRegisterRepeatPass() {
    bool showPass = !state.isObscureTextRepeatPassRegister;
    emit(state.copyWith(isObscureTextRepeatPassRegister: showPass));
  }

  Future<void> editUser({
    required String? name,
    required String? secondName,
  }) async {
    final myCurrentUser = AuthDto(
      idUser: state.myCurrentUser!.idUser,
      isAnonymous: state.myCurrentUser!.isAnonymous,
      eamil: state.myCurrentUser!.eamil,
      name: (name == null) ? state.myCurrentUser!.name : name,
      secondName: (secondName == null)
          ? state.myCurrentUser!.secondName
          : secondName,
    );
    await UserFirestoreRepository.updateNewUser(data: myCurrentUser);

    emit(state.copyWith(myCurrentUser: myCurrentUser));
  }
}
