import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_state.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:firebase_flutter_cifo/todo/data/repository/todo_firestore_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial()) {
    calculateActiveCount();
  }

  void toggleTodo(String id) {
    final List<TodoDto> newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return TodoDto(desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
    setFilteredTodos(state.selectedFilter);

    calculateActiveCount();
  }

  void editTodo({required String id, required String todoDesc}) {
    final newTodos = state.todos.map((element) {
      if (element.id == id) {
        TodoDto myDto = TodoDto(
          desc: todoDesc,
          id: id,
          completed: element.completed,
          idUser: element.idUser,
        );
        TodoFirestoreRepository.editTodo(data: myDto);
        return myDto;
      }
      return element;
    }).toList();

    emit(state.copyWith(todos: newTodos));
    setFilteredTodos(state.selectedFilter);
  }

  Future<void> getTodos() async {
    final myTodos = await TodoFirestoreRepository().getTodosByUserID();
    emit(state.copyWith(todos: myTodos, todosFiltered: myTodos));
  }

  void calculateActiveCount() {
    final int activeTodoCount = state.todos
        .where((element) => !element.completed)
        .toList()
        .length;
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }

  void setFilteredTodos(Filter filter) {
    List<TodoDto> filteredTodos;

    switch (filter) {
      case Filter.active:
        filteredTodos = state.todos
            .where((element) => element.completed == false)
            .toList();
        emit(state.copyWith(selectedFilter: Filter.active));
        break;
      case Filter.completed:
        filteredTodos = state.todos
            .where((element) => element.completed == true)
            .toList();
        emit(state.copyWith(selectedFilter: Filter.completed));
        break;
      case Filter.all:
        filteredTodos = state.todos;
        emit(state.copyWith(selectedFilter: Filter.all));
        break;
    }

    emit(state.copyWith(todosFiltered: filteredTodos));
  }

  void searchTodo(String text) {
    List<TodoDto> filteredTodos;

    if (state.selectedFilter == Filter.active) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .where((element) => element.completed == false)
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }

    if (state.selectedFilter == Filter.completed) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .where((element) => element.completed == true)
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }

    if (state.selectedFilter == Filter.all) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }
  }

  void selectedCubit(TodoDto todo) {
    emit(state.copyWith(selectedTodo: todo));
  }

  void addTodo(String todoDesc) {
    final TodoDto newTodo = TodoDto(
      desc: todoDesc,
      //TODO:
      idUser: FirebaseAuth.instance.currentUser!.uid,
    );

    final List<TodoDto> newTodos = [...state.todos, newTodo];

    TodoFirestoreRepository.addNewTodo(data: newTodo);

    emit(state.copyWith(todos: newTodos, selectedFilter: Filter.all));

    setFilteredTodos(state.selectedFilter);
  }

  void removeTodo(TodoDto todo) {
    // final List<TodoDto> newTodos = state.todos
    //     .where((element) => id != element.id)
    //     .toList();

    List<TodoDto> newTodos = state.todos;
    newTodos.remove(todo);
    TodoFirestoreRepository().removeTodo(data: todo);
    emit(state.copyWith(todos: newTodos));
    setFilteredTodos(state.selectedFilter);
  }
}
