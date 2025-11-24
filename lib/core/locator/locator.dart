import 'package:firebase_flutter_cifo/country/cubits/country_cubit/country_cubit.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  await registerCubits();
}

registerCubits() async {
  if (!locator.isRegistered<StartAppCubit>()) {
    locator.registerLazySingleton(() => StartAppCubit());
  }
  if (!locator.isRegistered<TodoListCubit>()) {
    locator.registerLazySingleton(() => TodoListCubit());
  }
  if (!locator.isRegistered<CountryCubit>()) {
    locator.registerLazySingleton(() => CountryCubit());
  }
}
